*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the drop-down menu works as expected and that items in the drop-down list are accessible
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Click element   ${Drop-downMenuButton}
    Wait until element is visible    ${Drop-downLinks}  timeout=10
    Click link    ${ItemToSelectFromDrop-down}
    Element text should be    ${Drop-downMenuButton}    ${DropDownCategoryDesktops}
