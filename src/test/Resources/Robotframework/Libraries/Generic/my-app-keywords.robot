*** Settings ***
Resource   imports.txt
*** Keywords ***
Open My Apps Page
    Mouse Down On Link  ${USER_MENU}
    Click Element   ${MY_APPS_LINK}
    Wait Until page contains   My Apps
    Element SHould Be Visible   ${ADD_A_NEW_APP_LINK}
