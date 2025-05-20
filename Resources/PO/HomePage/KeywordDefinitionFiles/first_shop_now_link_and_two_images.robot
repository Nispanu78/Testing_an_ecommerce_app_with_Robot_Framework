*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the first "Shop Now" link is clickable and that the two image below also are
    [Documentation]    Open  website
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Click link    ${FirstShopNowButton}
    Page should contain    ${DiscountWashingMachine}
    Execute javascript    document.querySelector("img[alt*='Lumix S Series From Panasonic']").click();
    Page should contain    ${Apple}
    Go back
    Execute javascript    document.querySelector("img[alt*='MPOW H12 RC Headphone']").click();
    Page should contain    ${Canon EOS 5D}


