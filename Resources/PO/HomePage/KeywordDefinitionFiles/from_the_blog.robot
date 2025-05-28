*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that that picture on the "From the blog" section of the page is clickable and that link to the blog's author is accessible
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${FromTheBlog}
    Execute javascript    document.querySelector("img[alt*='amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus']").click();
    Page should contain    amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus
    Go back
    Scroll element into view    ${FromTheBlog}
    Click element    ${BloggerNameLocator}
    Page should contain    Mark Jecno