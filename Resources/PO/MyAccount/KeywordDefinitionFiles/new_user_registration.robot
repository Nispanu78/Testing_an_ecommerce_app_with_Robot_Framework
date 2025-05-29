*** Settings ***
Library  SeleniumLibrary
Resource    ../Locators/locators_my_account.robot
Resource    ../TestData/test_data_my_account.robot

*** Variables ***


*** Keywords ***

Input Text Using Locator
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

User can access his own account page and register as a new user
    [Documentation]    Click icons
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window
    ${MyAccount}=    Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > a
    Mouse over    ${MyAccount}
    ${Login}=        Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > ul > li:nth-child(1) > a
    Click link    ${Login}
    Page should contain    ${MyAccountLoginText}
    Click element    ${AccessRegistrationFormButton}

#   Using Action Chains for mouse over and click actions
    Input Text Using Locator    ${InputTextLocatorFirstName}    ${FirstName}
    Input Text Using Locator    ${InputTextLocatorSurname}      ${LastName}
    Input Text Using Locator    ${Email}                        ${MyEmail}
    Input Text Using Locator    ${Telephone}                    ${TelephoneNum.}
    Input Text Using Locator    ${Password}                     ${MyPassword}
    Input Text Using Locator    ${ConfirmPassword}              ${MyConfirmedPassword}

    Page should contain radio button    ${RadioButton}
    Radio button should be set to       ${RadioButtonID}     ${RadioButtonNoDefaultOption}
#    Select the radio button with Execute JavaScript to avoid ElementClickInterceptedException
    Execute JavaScript    ${RadioButtonYesClicked}
#    Select the tick box with Execute JavaScript to avoid ElementClickInterceptedException
    Execute JavaScript    ${CheckListLocator}
    Click element         ${PrivacyPolicy}
    Click element         ${PrivacyPolicyClose}
    Sleep    1s
    Click element         ${ContinueButton}
    Page should contain   ${AccountConfirmationCreation}
    Click element         ${ContinueToMyAccountButton}
    Page should contain   ${MyCreatedAccount}




