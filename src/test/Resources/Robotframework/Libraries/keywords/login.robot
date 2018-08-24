*** Settings ***
Resource   imports.txt
*** Keywords ***
Fill Login Form
  [Arguments]  ${user}  ${pass}
  Wait until element is Visible      ${LOGIN_DIALOG}
  Wait Until Element Is Visible    ${LOGIN_DIALOG_USERNAME}
  Input Text    ${LOGIN_DIALOG_USERNAME}    ${user}
  Input password    ${LOGIN_DIALOG_PASS}     ${pass}
  Capture Page Screenshot
Gmail Verify Email Received
  [Arguments]   ${user}  ${pass}  ${body}
  Open Mailbox    host=imap.googlemail.com    user= ${user}   password=${pass}
  ${LATEST} =    Wait For Email    fromEmail=myapitest045@gmail.com    timeout=60
  ${html}=  Get Email Body  ${LATEST}
  Should Contain    ${html}    ${body}
  Log  ${LATEST}
Login To App
  [Arguments]    ${username}  ${pass}  ${name}
  Open Browser and Navigate To Devepoer Portal
  Element Should Be Visible    ${LOGIN_LINK}
  Element Should Not Be Visible    ${LOGIN_DIALOG}
  Click Element   ${LOGIN_LINK}
  Fill Login Form  ${username}  ${pass}
  Click Element   ${LOGIN_DIALOG_LOGIN_BTN}
  #Wait Until Page Contains   ${name}
