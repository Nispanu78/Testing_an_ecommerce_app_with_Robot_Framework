*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators_my_account.robot
Resource    ../TestData/test_data_my_account.robot

*** Variables ***


*** Keywords ***

Verify that My Account is accessible by user
    [Documentation]    Click icons
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    ${MyAccount}=    Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > a
    Mouse over    ${MyAccount}
    ${Login}=        Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > ul > li:nth-child(1) > a
    Click link    ${Login}
    Page should contain    ${MyAccountLoginText}