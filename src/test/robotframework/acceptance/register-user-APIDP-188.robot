*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library   OperatingSystem  WITH NAME  os
Library  String   WITH NAME  str
Resource   imports.txt
Library    ImapLibrary

*** Test Cases ***
User Registration - Success Scenarios
    [Template]    User Registration - Success
    Firstname   Lastname   yin1234  test.api.auto@gmail.com  pass  pass

*** Keywords ***
User Registration - Success
    [Arguments]   ${first_name}   ${last_name}   ${username}   ${email}   ${pass1}    ${pass2}
    Open Browser and Navigate To Devepoer Portal
    Element Should Be Visible    ${REGISTER_LINK}
    Element Should Not Be Visible    ${REGISTER_DIALOG}
    Click Element   ${REGISTER_LINK}
    Fill Registraion Form   ${first_name}   ${last_name}   ${username}   ${email}   ${pass1}    ${pass2}
    Click Element   ${REGISTER_DIALOG_CREATE_NEW_ACCOUNT_BTN}
    Wait until Element Is Visible   ${REGISTER_SUCCESS_DIV}
    Capture Page Screenshot
    Element Should Contain    ${REGISTER_SUCCESS_DIV}      ${REGISTER_SUCCESS_DIV_TXT1}
    Element Should Contain    ${REGISTER_SUCCESS_DIV}      ${REGISTER_SUCCESS_DIV_TXT2}
    Close Browser
    Gmail Verify Email Received   test.api.auto@gmail.com   Swift12345678    Thank you for registering at SWIFT Developer Portal.
