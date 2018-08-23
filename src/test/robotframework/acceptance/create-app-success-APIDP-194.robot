*** Settings ***
Resource   imports.txt

*** Test Cases ***
Create App Without CallBack URL - Success Scenarios
    [Template]   Create App - Success
    test.api.auto@gmail.com  pass  test.api.auto@  Test_APP_1   ${EMPTY}   True  True
Create App With CallBack URL - Success Scenarios
    [Template]   Create App - Success
    test.api.auto@gmail.com  pass  test.api.auto@  Test_APP_1   http:\\www.test.api.auto.com   True  True
*** Keywords ***
Create App - Success
    [Arguments]    ${username}  ${pass}  ${name}  ${myapp_name}  ${callback_url}  ${v1}  ${v2}
    ${myapp_name}=  Generate Random String  10  [LETTERS]
    Login To App  ${username}  ${pass}  ${name}
    Open My Apps Page
    Click Element   ${ADD_A_NEW_APP_LINK}
    Wait Until Element Is Visible  ${MY_APP_APPNAME}
    Input Text  ${MY_APP_APPNAME}  ${myapp_name}
    Input Text  ${MY_APP_CALLBACK_URL}  ${callback_url}
    Run Keyword If   ${v1}   Click Element   ${MY_APP_PRODUCT_V1_CHK}
    Run Keyword If   ${v2}   Click Element   ${MY_APP_PRODUCT_V2_CHK}
    Click Element  ${MY_APP_CREATE_APP_BTN}
    Element Should Contain  ${SUCCESS_DIV}   App Created!
    Element SHould Be Visible   ${MY_APPS_LIST}
    Element Should Contain   ${MY_APPS_LIST}   ${myapp_name}
    Element Should Be Visible  //div[@class='truncate']//a[contains(.,'${myapp_name}')]
    Element Should Be Visible  //div[@class='truncate']//a[contains(.,'${myapp_name}')]/parent::div/following-sibling::div[contains(.,'Approved')]
    Close All Browsers
