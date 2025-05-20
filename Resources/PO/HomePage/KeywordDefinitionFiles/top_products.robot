*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Hover And Click
    [Arguments]    ${hover_element}    ${click_element}    ${close_element}
    Mouse Over       ${hover_element}
    Click Element    ${click_element}
    Sleep    1s  # Wait for the action to complete
    Click Element    ${close_element}

Verify that that pictures on the "Top Products" section of the page are clickable and accessible
    [Documentation]    Top trending
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${TopProductsSection}

    # Using Action Chains for mouse over and click actions
    Hover And Click    ${PicToHoverOver}    ${ImageCartButton}    ${CloseCartButton}
    Hover And Click    ${PicToHoverOver}    ${ImageWishListButton}    ${CloseWishListButton}
    Hover And Click    ${PicToHoverOver}    ${ImageQuickViewButton}    ${CloseImageQuickViewButton}
    Hover And Click    ${PicToHoverOver}    ${CompareImageButton}    ${CloseCompareImageButton}

