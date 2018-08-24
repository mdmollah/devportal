*** Settings ***
Resource   imports.txt
*** Keywords ***
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
