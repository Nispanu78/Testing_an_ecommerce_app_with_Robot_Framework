*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the main picture on the "Top Trending Categories" section of the page is clickable and accessible
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Execute javascript    document.querySelector("img[alt*='HP25 headphone']").click();
    Page should contain    HP LP3065