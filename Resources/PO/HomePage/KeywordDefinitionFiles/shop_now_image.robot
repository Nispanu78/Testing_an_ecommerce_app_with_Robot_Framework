*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that that picture below "Top Collection" section is clickable
    [Documentation]    Top trending
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${ShopNowImage}
    Execute javascript    document.querySelector("img[alt*='Apple Ipad Pro']").click();
    Page should contain    iPod Touch