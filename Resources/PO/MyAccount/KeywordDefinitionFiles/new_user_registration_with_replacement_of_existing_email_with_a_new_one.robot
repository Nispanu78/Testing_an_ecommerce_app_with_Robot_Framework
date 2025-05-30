*** Settings ***
Library         SeleniumLibrary
Library         String
Library         Collections
Resource        ../Locators/locators_my_account.robot
Resource        ../TestData/test_data_my_account.robot

*** Variables ***
#Email is changed automatically to luigini_my_test3@mail.com, if luigini_my_test2@mail.com has been already registered
${BASE_EMAIL}   luigini_my_test2@mail.com

# Corrected locator for the email input field to use the existing variable
${EMAIL_FIELD}       ${Email}
${REGISTER_WARNING}  xpath://div[contains(@class, 'alert') and contains(text(), 'Warning: E-Mail Address is already registered!')]

*** Keywords ***
Input Text Using Locator
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Increment Email
    [Arguments]    ${current_email}
    # Separate the email into local_part and domain
    ${parts}=      Split String    ${current_email}    @
    ${local_part}=    Set Variable    ${parts[0]}
    ${domain_part}=    Set Variable    @${parts[1]}

    # Ensure the local_part is clean (no leading/trailing whitespace)
    ${local_part}=    Strip String    ${local_part}

    Log To Console    DEBUG: Processing email: ${current_email}
    Log To Console    DEBUG: Local part extracted: '${local_part}'
    Log To Console    DEBUG: Domain part extracted: '${domain_part}'

    # Find all sequences of digits in the local part
    ${all_numbers_matches}=    Get Regexp Matches    ${local_part}    (\\d+)
    Log To Console    DEBUG: All digit matches found: ${all_numbers_matches}

    ${extracted_number}=    Set Variable    ${EMPTY}
    ${prefix}=              Set Variable    ${EMPTY}
    ${number_found_at_end}=    Set Variable    ${FALSE}

    # Check if any numbers were found and if the last one is at the end of the string
    IF    len($all_numbers_matches) > 0
        # Get the actual number string from the last match
        ${last_matched_num}=    Set Variable    ${all_numbers_matches[-1][0]}
        Log To Console    DEBUG: Last matched number: '${last_matched_num}'

        IF    $local_part.endswith($last_matched_num)
            ${number_found_at_end}=    Set Variable    ${TRUE}
            ${extracted_number}=       Set Variable    ${last_matched_num}

            # --- CRITICAL FIX HERE ---
            # Calculate the negative length using Evaluate before passing to Get Substring
            ${num_length}=             Evaluate    len('${extracted_number}')
            ${end_index_for_substring}=    Evaluate    -${num_length}
            ${prefix}=                 Get Substring    ${local_part}    0    ${end_index_for_substring}
            # --- END CRITICAL FIX ---

            Log To Console    DEBUG: Number '${extracted_number}' found at end with prefix '${prefix}'.
        ELSE
            Log To Console    DEBUG: Last matched number is not at the end of the local part.
        END
    ELSE
        Log To Console    DEBUG: No digit sequences found in local part.
    END

    ${new_local_part}=      Set Variable    ${EMPTY}

    IF    ${number_found_at_end} is ${TRUE}
        ${incremented_num}=     Evaluate    int(${extracted_number}) + 1
        ${new_local_part}=      Catenate    SEPARATOR=    ${prefix}${incremented_num}
        Log To Console    DEBUG: Incremented number: ${incremented_num}, New local part: ${new_local_part}
    ELSE
        # If no number found at the end (or no numbers at all), append '1' to the original local_part
        ${new_local_part}=      Catenate    SEPARATOR=    ${local_part}1
        Log To Console    DEBUG: Appending '1', New local part: ${new_local_part}
    END

    ${new_email}=     Catenate    SEPARATOR=    ${new_local_part}${domain_part}
    Log To Console    Original email: ${current_email}, Generated New email: ${new_email}
    RETURN            ${new_email}

Handle Existing Email Warning
    Log To Console    Warning: E-Mail Address is already registered! detected. Attempting to increment email.
    ${current_email_value}=    Get Element Attribute    ${EMAIL_FIELD}    value
    ${new_email}=              Increment Email    ${current_email_value}
    Clear Element Text         ${EMAIL_FIELD}
    Input Text                 ${EMAIL_FIELD}     ${new_email}
    Set Test Variable          ${BASE_EMAIL}      ${new_email} # Update BASE_EMAIL for subsequent retries if needed
    Sleep    1s    # Small delay to ensure input field is ready

User can send replace an already existing email with a new one if he gest a warning that email is already registered
    [Documentation]    Click icons, attempts registration, handles existing email warning, and sends contact form.
    Set Selenium Timeout   2s
    Set Selenium Speed     1s
    Open Browser    ${URL}      ${PreferredBrowser}
    Maximize browser window

    # Navigate to Registration Form
    ${MyAccount}=    Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > a
    Mouse over    ${MyAccount}
    ${Login}=        Get WebElement  css=#widget-navbar-217834 > ul > li:nth-child(6) > ul > li:nth-child(1) > a
    Click link    ${Login}
    Page should contain    ${MyAccountLoginText}
    Click element    ${AccessRegistrationFormButton}

     # Add this line to see what value Robot Framework is using for BASE_EMAIL
    Log To Console    The value of BASE_EMAIL before input is: ${BASE_EMAIL}

    # Perform Initial Registration Details Input
    Input Text Using Locator    ${InputTextLocatorFirstName}    ${FirstName}
    Input Text Using Locator    ${InputTextLocatorSurname}      ${LastName}
    Input Text Using Locator    ${EMAIL_FIELD}                  ${BASE_EMAIL}
    Input Text Using Locator    ${Telephone}                    ${TelephoneNum.}
    Input Text Using Locator    ${Password}                     ${MyPassword}
    Input Text Using Locator    ${ConfirmPassword}              ${MyConfirmedPassword}

    Page should contain radio button    ${RadioButton}
    Radio button should be set to       ${RadioButtonID}     ${RadioButtonNoDefaultOption}
    Execute JavaScript    ${RadioButtonYesClicked}
    Execute JavaScript    ${CheckListLocator}

    # Handle Privacy Policy And Submit
    Click element         ${PrivacyPolicy}
    Click element         ${PrivacyPolicyClose}
    Sleep    1s
    Click element         ${ContinueButton}

    # --- Core Logic for Email Warning Handling ---
    ${warning_present}=    Run Keyword And Return Status    Page Should Contain Element    ${REGISTER_WARNING}

    IF    ${warning_present}
        Handle Existing Email Warning
        # Re-submit the form with the new email
        Click element         ${ContinueButton}
        # After re-submission, check again if it was successful or if another warning appeared
        ${second_warning_present}=    Run Keyword And Return Status    Page Should Contain Element    ${REGISTER_WARNING}
        IF    ${second_warning_present}
            Log To Console    Warning: E-Mail Address is already registered! detected again after increment.
            Fail    Could not register even after incrementing email.
        ELSE
            Log To Console    Email incremented successfully, proceeding with registration.
            Page should contain   ${AccountConfirmationCreation}
        END
    ELSE
        Log To Console    No email warning found, continuing with registration process.
        Page should contain   ${AccountConfirmationCreation}
    END
    # --- End of Core Logic for Email Warning Handling ---

    # Proceed to Contact Form regardless of initial warning outcome (if registration succeeded)
    Click element             ${ContactUsLink}
    Input text                ${ContactFormEnquiry}   ${ContactFormEnquiryText}
    Click element             ${SubmitContactForm}
    Page should contain       ${ContactFormConfirmationMessage}
    Click element             ${ContactFormContinueButton}
    Element should be enabled    ${ContactFormCompareIconAssertion}
