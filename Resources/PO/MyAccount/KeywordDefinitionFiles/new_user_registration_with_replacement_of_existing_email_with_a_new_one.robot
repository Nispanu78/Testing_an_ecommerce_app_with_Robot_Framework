*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Resource    ../Locators/locators_my_account.robot
Resource    ../TestData/test_data_my_account.robot

*** Variables ***
${BASE_EMAIL}                   luigini_my_test2@mail.com
${EMAIL_WARNING_MESSAGE}        xpath=//*[contains(text(), 'Warning: E-Mail Address is already registered!')]

*** Keywords ***
Input Text Using Locator
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Extract Email Number
    [Arguments]    ${email}
    ${email_parts}=    Split String    ${email}    @
    ${local_part}=     Get From List    ${email_parts}    0
    ${domain_part}=    Get From List    ${email_parts}    1
    ${number}=         Get Regexp Matches    ${local_part}    \\d+$
    ${current_number}=    Get From List    ${number}    0
    ${base_email}=     Replace String Using Regexp    ${local_part}    \\d+$    ${EMPTY}
    RETURN    ${current_number}    ${base_email}    ${domain_part}

Generate Next Email
    [Arguments]    ${current_email}
    ${current_number}    ${base_email}    ${domain_part}=    Extract Email Number    ${current_email}
    ${next_number}=    Evaluate    int(${current_number}) + 1
    ${new_email}=      Set Variable    ${base_email}${next_number}@${domain_part}
    RETURN    ${new_email}

User can send replace an already existing email with a new one if he gest a warning that email is already registered
    [Documentation]    Click icons
    Set Selenium Timeout    2s
    Set Selenium Speed       1s
    Open Browser            ${URL}    ${PreferredBrowser}
    Maximize browser window

    ${MyAccount}=    Get WebElement    css=#widget-navbar-217834 > ul > li:nth-child(6) > a
    Mouse over       ${MyAccount}
    ${Login}=        Get WebElement    css=#widget-navbar-217834 > ul > li:nth-child(6) > ul > li:nth-child(1) > a
    Click link       ${Login}
    Page should contain    ${MyAccountLoginText}
    Click element          ${AccessRegistrationFormButton}

    # Fill registration form (except email)
    Input Text Using Locator    ${InputTextLocatorFirstName}    ${FirstName}
    Input Text Using Locator    ${InputTextLocatorSurname}     ${LastName}
    Input Text Using Locator    ${Telephone}                   ${TelephoneNum.}
    Input Text Using Locator    ${Password}                    ${MyPassword}
    Input Text Using Locator    ${ConfirmPassword}             ${MyConfirmedPassword}

    Page should contain radio button    ${RadioButton}
    Radio button should be set to       ${RadioButtonID}    ${RadioButtonNoDefaultOption}
    # Select the radio button with Execute JavaScript to avoid ElementClickInterceptedException
    Execute JavaScript    ${RadioButtonYesClicked}
    # Select the tick box with Execute JavaScript to avoid ElementClickInterceptedException
    Execute JavaScript    ${CheckListLocator}
    Click element         ${PrivacyPolicy}
    Click element         ${PrivacyPolicyClose}
    Sleep                 1s

    # Email input with auto-increment logic
    ${current_email}=    Set Variable    ${BASE_EMAIL}

    FOR    ${attempt}    IN RANGE    1    100    # Maximum 100 attempts to avoid infinite loop
        Log    Attempting to register with email: ${current_email}

        # Only this line is in the FOR loop - input email and submit
        Input Text Using Locator    ${Email}    ${current_email}
        Click element               ${ContinueButton}

        # Wait a moment for the page to process
        Sleep    2s

        # Check if warning message appears
        ${warning_present}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    ${EMAIL_WARNING_MESSAGE}    timeout=5s

        IF    ${warning_present}
            Log    Warning detected! Email ${current_email} is already registered.
            ${current_email}=    Generate Next Email    ${current_email}
            Log    Trying next email: ${current_email}

            # Clear the email field for next attempt
            Clear Element Text    ${Email}

            # Continue the loop with the new email
        ELSE
            Log    Successfully registered with email: ${current_email}
            Page should contain    ${AccountConfirmationCreation}
            BREAK
        END
    END

    # If we've tried 100 times and still getting warnings, fail the test
    IF    ${attempt} == 99
        Fail    Failed to register after 100 email attempts
    END

    # Continue with contact form submission
    Click element    ${ContactUsLink}
    Input text       ${ContactFormEnquiry}    ${ContactFormEnquiryText}
    Click element    ${SubmitContactForm}
    Page should contain    ${ContactFormConfirmationMessage}
    Click element    ${ContactFormContinueButton}
    Element should be enabled    ${ContactFormCompareIconAssertion}