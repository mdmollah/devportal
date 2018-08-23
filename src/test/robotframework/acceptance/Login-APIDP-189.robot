*** Settings ***
Resource   imports.txt

*** Test Cases ***
Login - Success Scenarios
    [Template]   Login - Success
    test.api.auto@gmail.com  pass  test.api.auto@

*** Keywords ***
Login - Success
    [Arguments]    ${username}  ${pass}  ${name}
    Open Browser and Navigate To Devepoer Portal
    Element Should Be Visible    ${LOGIN_LINK}
    Element Should Not Be Visible    ${LOGIN_DIALOG}
    Click Element   ${LOGIN_LINK}
    Fill Login Form  ${username}  ${pass}
    Click Element   ${LOGIN_DIALOG_LOGIN_BTN}
    Wait Until Page Contains   ${name}
    #validate Email Notification
    Close All Browsers
