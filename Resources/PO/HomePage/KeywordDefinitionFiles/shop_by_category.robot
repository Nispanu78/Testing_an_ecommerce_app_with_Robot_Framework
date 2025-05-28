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
    Execute javascript    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Components') el.click(); });
    Page should contain     ${ComponentCategoryText}
    Execute javascript    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Web Cameras') el.click(); });
    Page should contain    ${WebCameraCategoryText}
    Execute javascript    ${ShopByCategoryLink}
    Wait Until Element Is Visible    ${CategoriesWidgetContainer}
    Execute Javascript    document.querySelectorAll('#widget-navbar-217841 a').forEach(el => { if (el.textContent.trim() === 'Printers & Scanners') el.click(); });
    Page should contain    ${WebCameraCategoryText}



