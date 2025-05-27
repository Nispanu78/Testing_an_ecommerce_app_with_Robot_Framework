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

User can access his own account page
    e-commerce_playground_app_my_account.Click on My Account section of the nav bar