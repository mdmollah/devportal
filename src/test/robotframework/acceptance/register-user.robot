*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary

*** Test Cases ***
Open Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go to    https://developer.swiftlab-api-developer.com/
    Set Window Size    1650    1050
    Capture Page Screenshot
