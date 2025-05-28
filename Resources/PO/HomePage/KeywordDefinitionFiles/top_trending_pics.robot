*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that that pictures on the "Top Trending Categories" section of the page are clickable and accessible
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${TopTrendingCategoriesSection}
#    Execute javascript    document.querySelector("img[alt*='HP25 headphone']").click();
#    Page should contain    HP LP3065
    Execute javascript    document.querySelector("img[alt*='Desktops']").click();
    Go back
    Execute javascript    document.querySelector("img[alt*='Laptops']").click();
    Go back
    Execute javascript    document.querySelector("img[alt*='Components']").click();
    Go back
    Execute javascript    document.querySelector("img[alt*='Tablets']").click();
    Go back
    Execute javascript    document.querySelector("img[alt*='Software']").click();
    Go back
    Execute javascript    document.querySelector("img[alt*='Phones & PDAs']").click();
    Go back

