*** Settings ***
Resource   imports.txt

*** Test Cases ***
Login - Error Scenarios
    [Template]   Login - Error
    test.api.auto11111111111111111@gmail.com  pass  Sorry, unrecognized username or password.
    ${EMPTY}  pass  Username or e-mail address field is required.
    test.api.auto@gmail.com  pass1  Sorry, unrecognized username or password.
    test.api.auto@gmail.com  ${EMPTY}  Password field is required
    test.api.auto11111111111111@gmail.com  pass1  Sorry, unrecognized username or password.
*** Keywords ***
Login - Error
    [Arguments]    ${username}  ${pass}  ${ERROR_MSG}
    Open Browser and Navigate To Devepoer Portal
    Element Should Be Visible    ${LOGIN_LINK}
    Element Should Not Be Visible    ${LOGIN_DIALOG}
    Click Element   ${LOGIN_LINK}
    Fill Login Form  ${username}  ${pass}
    Click Element   ${LOGIN_DIALOG_LOGIN_BTN}
    Wait until Element Is Visible   ${REGISTER_DIALOG_ERROR_DIV}
    Element Should Contain    ${REGISTER_DIALOG_ERROR_DIV}      ${ERROR_MSG}
    Close All Browsers
