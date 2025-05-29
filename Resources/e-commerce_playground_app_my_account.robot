
*** Settings ***
Resource   ./PO/MyAccount/KeywordDefinitionFiles/my_account.robot
Resource   ./PO/MyAccount/KeywordDefinitionFiles/new_user_registration.robot

*** Variables ***


*** Keywords ***

Click on My Account section of the nav bar
    my_account.Verify that My Account is accessible by user

Register a new user
    new_user_registration.User can access his own account page and register as a new user