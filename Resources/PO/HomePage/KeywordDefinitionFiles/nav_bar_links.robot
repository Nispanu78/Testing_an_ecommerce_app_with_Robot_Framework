*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that each link in the nav bar is accessible
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    FOR    ${index}    IN RANGE    4
        ${links}=    Get WebElements    css:#widget-navbar-217834 a
        ${link}=     Get WebElement    ${links}[${index}]
        ${link_text}=    Get Text    ${link}
        Log    Clicking link: ${link_text}
        Click link    ${link}
    END
    ${AddOns}=    Get WebElement    css=#widget-navbar-217834 > ul > li:nth-child(5) > a
    Mouse Over    ${AddOns}
    ${Modules}=   Get WebElement    css=#widget-navbar-217834 > ul > li:nth-child(5) > ul > li:nth-child(1) > a
    Click link    ${Modules}
    Page should contain     ${AddOnsModulesText}
    ${MyAccount}=    Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > a
    Mouse over    ${MyAccount}
    ${Login}=        Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > ul > li:nth-child(1) > a
    Click link    ${Login}
    Page should contain    ${MyAccountLoginText}



