
*** Settings ***
Resource   ./PO/MyAccount/KeywordDefinitionFiles/my_account.robot
Resource   ./PO/MyAccount/KeywordDefinitionFiles/new_user_registration.robot
Resource   ./PO/MyAccount/KeywordDefinitionFiles/new_user_registration_failed.robot
Resource   ./PO/Myaccount/KeywordDefinitionFiles/new_user_registration_with_replacement_of_existing_email_with_a_new_one.robot

*** Variables ***


*** Keywords ***

#Click on My Account section of the nav bar
#    my_account.Verify that My Account is accessible by user
#
#Register a new user
#    new_user_registration.User can access his own account page and register as a new user
#
#Send a contact form if confirmation email has not been sent
#    new_user_registration_failed.User can send a contact form if confirmation email has not been received

User registers with previously registered email, gets a warning that email is already registered and chooses a new one
    new_user_registration_with_replacement_of_existing_email_with_a_new_one.User can replace an already existing email with a new one if he get a warning that the inserted email is already registered
