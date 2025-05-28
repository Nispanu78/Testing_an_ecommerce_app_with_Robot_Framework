*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that the provided URL is accessible and that user can land on homepage
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}

Verify that user can search for an item and retrieve it
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Input text  ${SearchBox}   ${ItemToBeSearched}
    Click button    ${SearchButton}
    Page should contain image    ${SearchedItem}

Verify that user can hover over the image that is displayed after text is inputted in the search bar
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Input text  ${SearchBox}   ${ItemToBeSearched}
    Wait Until Element Is Visible    ${ImageToClick}  timeout=10
    Wait Until Element Is Enabled    ${ImageToClick}    timeout=10
#    Here JavaScript is used in order to click directly on the image, since standard click methods (mouse over + mouse down) were ineffective
    Execute javascript    document.querySelector("img[alt*='MacBook Pro']").click();
    Page should contain image    ${ImageToClick}

