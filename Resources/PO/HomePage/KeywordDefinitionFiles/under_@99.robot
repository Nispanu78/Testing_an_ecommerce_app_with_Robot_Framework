*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Hover And Click
    [Arguments]    ${hover_element}  ${click_element}    ${close_element}
    Mouse Over       ${hover_element}
    Execute javascript     ${click_element}
    Sleep    1s  # Wait for the action to complete
    Click Element    ${close_element}
    Sleep    2s  # Wait for the action to complete


Verify that that picture below "Under @99" sub-header is clickable and that menu options are accessible
    [Documentation]    Nav bar
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${Under99Image}


    # Using Action Chains for mouse over and click actions
    Hover And Click    ${Under99Image}    ${ImageCartButtonUnder99}   ${CloseCartButton}
    Hover And Click    ${Under99Image}    ${ImageWishListUnder99}    ${CloseWishListButton}
    Hover And Click    ${Under99Image}    ${ImageQuickViewUnder99}    ${CloseImageQuickViewButton}
    Hover And Click    ${Under99Image}    ${ImageCloseCompareUnder99}    ${CloseCompareImageButton}
    Sleep    2s
    Click element    ${Under99Image}
    Page should contain    Nikon D300