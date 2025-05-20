*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the icons on the top-right part of the home page are clickable
    [Documentation]    Top-right icons
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Click element    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Components') el.click(); });
    Page should contain     ${ComponentCategoryText}
    Click element    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Web Cameras') el.click(); });
    Page should contain    ${WebCameraCategoryText}
    Click element    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Printers & Scanners') el.click(); });
    Page should contain    ${WebCameraCategoryText}



