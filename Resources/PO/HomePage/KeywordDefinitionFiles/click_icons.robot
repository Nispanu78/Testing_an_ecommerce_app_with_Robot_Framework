*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the icons on the top-right part of the home page are clickable
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Click link    ${CompareIcon}
    Page should contain    ${CompareIconText}
    Click link    ${WishListicon}
    Page should contain    ${WishilistIconText}
    Click link    ${CartIcon}
    Page should contain link    ${EditCartLink}

