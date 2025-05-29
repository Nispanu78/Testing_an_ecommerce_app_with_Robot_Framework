*** Settings ***

Resource    ../Resources/e-commerce_playground_app_my_account.robot
Resource    ../Resources/common_web.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${BROWSER} =  headlesschrome

#Location of test suite and command to start
#the Robot Framework C:\Users\HV322VM\OneDrive - EY\Desktop\lambada_testing_ecommerce_playground\Tests> robot -d results tests_e-commerce_app.robot
#To run only tagged test cases use the following command: robot -d results -i HomePage tests_e-commerce_app.robot
#To perform a dry run where keywords coming from test libraries are not executed (used to validate test data run: robot -d results --dryrun tests_e-commerce_app.robot
#To use the "ExcludeTests" prerun modifier, use the following syntax:
#robot --prerunmodifier PythonScripts/ExcludeTests.py:*list tests_e-commerce_app.robot

*** Test Cases ***

#User can access his own account page
#    [Documentation]    This is a test suite create for training purposes in order to practice automated testing
#    ...                With Robot Framework and Selenium WebDriver. The system under test consists of a dummy
#    ...                e-commerce web application provided by Lambdatest.io
#    [Tags]    MyAccount
#    e-commerce_playground_app_my_account.Click on My Account section of the nav bar
#
#User can access his own account page and register as a new user
#    e-commerce_playground_app_my_account.Register a new user

#Replace the email of test user before performing this test
User can send an email via the "Contact us" form if confirmation email is not received within one hour
    e-commerce_playground_app_my_account.Send a contact form if confirmation email has not been sent