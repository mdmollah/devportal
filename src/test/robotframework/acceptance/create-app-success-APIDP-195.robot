*** Settings ***
Resource   imports.txt

*** Test Cases ***
Create App - Error Scenarios
    [Template]   Create App - Error
    test.api.auto@gmail.com  pass  test.api.auto@  ${EMPTY}  http:\\www.test.api.auto.com   True  True  App Name field is required.
    test.api.auto@gmail.com  pass  test.api.auto@  TEST_APP_AUTO  http:\\www.test.api.auto.com   False  False  Product field is required.
*** Keywords ***
Create App - Error
    [Arguments]    ${username}  ${pass}  ${name}  ${myapp_name}  ${callback_url}  ${v1}  ${v2}  ${ERROR}
    #${myapp_name}=  Generate Random String  10  [LETTERS]
    Login To App  ${username}  ${pass}  ${name}
    Open My Apps Page
    Click Element   ${ADD_A_NEW_APP_LINK}
    Wait Until Element Is Visible  ${MY_APP_APPNAME}
    Input Text  ${MY_APP_APPNAME}  ${myapp_name}
    Input Text  ${MY_APP_CALLBACK_URL}  ${callback_url}
    Run Keyword If   ${v1}   Click Element   ${MY_APP_PRODUCT_V1_CHK}
    Run Keyword If   ${v2}   Click Element   ${MY_APP_PRODUCT_V2_CHK}
    Click Element  ${MY_APP_CREATE_APP_BTN}
    Element Should Contain  ${ERROR_DIV}   ${ERROR}
    Element Should Not Be Visible  //div[@class='truncate']//a[contains(.,'${myapp_name}')]
    Close All Browsers
