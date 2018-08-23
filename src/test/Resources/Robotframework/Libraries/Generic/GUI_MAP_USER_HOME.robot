*** Variables ***
${USER_MENU}  //a[@class='dropdown-toggle']
${MY_APPS_LINK}  //a[contains(.,'My Apps')]
${LOGOUT_LINK}  //a[contains(.,'Logout')]
${ADD_A_NEW_APP_LINK}  //a[contains(.,'Add a new App')]

${MY_APP_APPNAME}  //*[@id="edit-human"]
${MY_APP_CALLBACK_URL}  //*[@id="new_callback_url"]
${MY_APP_PRODUCT_V1_CHK}  //*[@id="edit-api-product-prod-swift-apitracker-pilot-v1"]
${MY_APP_PRODUCT_V2_CHK}  //*[@id="edit-api-product-prod-tracker-api-v2"]
${MY_APP_CREATE_APP_BTN}  //*[@id="edit-submit"]
${SUCCESS_DIV}   //*[@class='alert alert-block alert-success messages status']
${ERROR_DIV}   //*[@class='alert alert-block alert-danger messages error']
${MY_APPS_LIST}  //*[@id="my-apps-accordion"]
