*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators.robot
Resource    ../TestData/item_to_search.robot

*** Variables ***


*** Keywords ***

Verify that carousel works as expected by automatically loops over three different pictures and that it is possible to click an image
    [Documentation]    Open  website
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Sleep    5  # Wait for the carousel to change automatically
    ${first_image} =    Get Element Attribute    ${Iphone 11 pro max}    src
    Sleep    5  # Wait for the carousel to change again
    ${second_image} =    Get Element Attribute    ${Microsoft smartwatch}    src
    Should Not Be Equal    ${first_image}    ${second_image}    # Check if images are different
    Sleep    5  # Wait for the image to change
    ${ChangePicManually}    Get WebElement    css=#mz-carousel-217960 .carousel-control-next
    Mouse over    ${ChangePicManually}
    Execute javascript    document.querySelector('#mz-carousel-217960 .carousel-control-next').click()
    ${third_image} =    Get Element Attribute    ${Canon DSLR camera}    src
    Should Not Be Equal    ${second_image}    ${third_image}    # Check if the image has changed