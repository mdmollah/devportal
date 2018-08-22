*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library   OperatingSystem  WITH NAME  os
Library  String   WITH NAME  str
Resource   imports.txt

*** Test Cases ***
User Registration - Fail Scenarios
    [Template]   User Registration - Fail
    Firstname   Lastname   yin123  test.auto.swift.com  pass  pass  The e-mail address test.auto.swift.com is not valid.
    ${EMPTY}   Lastname   yin123   test.auto@swift.com  pass  pass  First Name field is required.
    Firstname  ${EMPTY}  yin123   test.auto@swift.com  pass  pass  Last Name field is required.
    Firstname  Lastname  ${EMPTY}   test.auto@swift.com  pass  pass  Username field is required.
    Firstname  Lastname  test123  ${EMPTY}  pass  pass  E-mail address field is required.
    Firstname  Lastname  test123  test.auto@swift.com  ${EMPTY}  pass  Password field is required.
    Firstname  Lastname  test123  test.auto@swift.com    pass  ${EMPTY}  The specified passwords do not match.

*** Keywords ***
User Registration - Fail
    [Arguments]   ${first_name}   ${last_name}   ${username}   ${email}   ${pass1}    ${pass2}   ${ERROR_MSG}
    Open Browser and Navigate To Devepoer Portal
    Element Should Be Visible    ${REGISTER_LINK}
    Element Should Not Be Visible    ${REGISTER_DIALOG}
    Click Element   ${REGISTER_LINK}
    Fill Registraion Form   ${first_name}   ${last_name}   ${username}   ${email}   ${pass1}    ${pass2}
    Click Element   ${REGISTER_DIALOG_CREATE_NEW_ACCOUNT_BTN}
    Wait until Element Is Visible   ${REGISTER_DIALOG_ERROR_DIV}
    Element Should Contain    ${REGISTER_DIALOG_ERROR_DIV}      ${ERROR_MSG}
    Close Browser
