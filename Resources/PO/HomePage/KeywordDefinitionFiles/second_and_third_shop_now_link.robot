*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the second and third "Shop Now" link are clickable
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${ScrollIntoViewAfterClickingShopNow}
    Click element    ${SecondShopNowButton}
    Scroll element into view    ${ScrollIntoViewAfterClickingShopNow2}
    Click element    ${ThirdShopNowButton}