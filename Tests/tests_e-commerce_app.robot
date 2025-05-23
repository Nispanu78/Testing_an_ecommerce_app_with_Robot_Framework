*** Settings ***

Resource    ../Resources/e-commerce_playground_app.robot
Resource    ../Resources/common_web.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${BROWSER} =  headlesschrome

#Location of test suite and command to start
#the Robot Framework C:\Users\HV322VM\OneDrive - EY\Desktop\lambada_testing_ecommerce_playground\Tests> robot -d results tests_e-commerce_app.robot
#To run only tagged test cases use the following command: robot -d results -i HomePage tests_e-commerce_app.robot
#To perform a dry run where keywords coming from test libraries are not executed (used to validate test data run: robot -d results --dryrun tests_e-commerce_app.robot

*** Test Cases ***

User can land on the home page of the e-commerce app
    [Tags]    HomePage
    e-commerce_playground_app.Go to Home Page

User can search for an item through the search bar in the home page
    [Tags]    HomePage
    e-commerce_playground_app.Search for an item through the search bar in the home page

User can hover over the image displayed when searched item is retrieved
    [Tags]    HomePage
    e-commerce_playground_app.Search for an item through the search bar, hover over its image and click on the image

User can open the drop-down menu and choose a category from the drop-down list
    [Tags]    HomePage
    e-commerce_playground_app.Open the drop-down menu and choose a category

User can click on the three icons on the top-right section of the home page
    [Tags]    HomePage
    e-commerce_playground_app.Click icons on the top-right part of the home page

User can click the Shop by Category link and access the categories contained in it
    [Tags]    HomePage
    e-commerce_playground_app.Click the Shop by Category link and access one of the categories

User can click each link in the nav bar and access relevant information
    [Tags]    HomePage
    e-commerce_playground_app.Click each link in the nav bar

User can see the main image on the home page change automatically and click on the left-arrow to change it manually
    [Tags]    HomePage
    e-commerce_playground_app.Assert that carousel work as expected and that main picture in the home page is clickable

User can click the "Shop Now" button and the two images related to it
    [Tags]    HomePage
    e-commerce_playground_app.Click the first Shop Now button and the two images located below

User can click on the pics on the "Top Trending Categories" of the home page
    [Tags]    HomePage
    e-commerce_playground_app.Click the pics on the "Top trending categories" of the home page

User can click on the pics on the "Top products" section of the page
    [Tags]    HomePage
    e-commerce_playground_app.Click pics on the "Top Products" section of the page

User can click the third and second "Shop now" buttons
    [Tags]    HomePage
    e-commerce_playground_app.Click the second and third "Shop Now" button

