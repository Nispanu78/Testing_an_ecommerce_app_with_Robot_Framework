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


Verify that that options on "Top collection" sub-header are clickable, that images are clickable and that menu options are accessible
    [Documentation]    Nav bar
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    Scroll element into view    ${TopCollectionSection}
    ${elements}=    Get WebElements    ${TopCollectionUnorderListOptions}
    FOR    ${link}    IN    @{elements}
        Click Element    ${link}
    END
    Sleep    1s
    Click element    ${TopCollectionNextButton}
    Click element    ${TopCollectionPreviewButton}
#    Scroll element into view    ${PicToHoverOverTopCollection}

    # Using Action Chains for mouse over and click actions
    Hover And Click    ${PicToHoverOverTopCollection}     ${ImageCartButtonTopCollection}   ${CloseCartButton}
    Hover And Click    ${PicToHoverOverTopCollection}    ${ImageWishListButtonTopCollection}    ${CloseWishListButton}
    Hover And Click    ${PicToHoverOverTopCollection}    ${ImageQuickViewButtonTopCollection}    ${CloseImageQuickViewButton}
    Hover And Click    ${PicToHoverOverTopCollection}    ${CompareImageButtonTopCollection}    ${CloseCompareImageButton}
    Sleep    2s
    Click element    ${PicToClickTopCollection}
