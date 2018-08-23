*** Settings ***
Resource   imports.txt
*** Keywords ***
Open Browser and Navigate To Devepoer Portal
    Open Browser
    Navigate to    https://developer.swiftlab-api-developer.com/
    set selenium speed  0.5 seconds
Open Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}

Navigate to
    [Arguments]   ${URL}
    Go to   ${URL}
    Set Window Size    1650    1050
    Capture Page Screenshot
Fill Registraion Form
  [Arguments]   ${first_name}   ${last_name}   ${username}   ${email}   ${pass1}    ${pass2}
  Wait until element is Visible      ${REGISTER_DIALOG}
  Element Should Be Visible   ${REGISTER_DIALOG_LABEL}
  Element Should Contain   ${REGISTER_DIALOG_LABEL}     ${REGISTER_DIALOG_LABEL_TXT}
  Input Text    ${REGISTER_DIALOG_FIRST_NAME}    ${first_name}
  Input Text    ${REGISTER_DIALOG_LAST_NAME}     ${last_name}
  Input Text    ${REGISTER_DIALOG_USERNAME}    ${username}
  Input Text    ${REGISTER_DIALOG_EMAIL}    ${email}
  Input Password    ${REGISTER_DIALOG_PASS}     ${pass1}
  Input Password    ${REGISTER_DIALOG_PASS_CONFIRM}     ${pass2}
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
