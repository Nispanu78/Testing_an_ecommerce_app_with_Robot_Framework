*** Settings ***

Resource    ../Resources/e-commerce_playground_app.robot
Resource    ../Resources/common_web.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${BROWSER} =  headlesschrome

#Location of test suite and
#command to start Robot Framework C:\Users\HV322VM\OneDrive - EY\Desktop\lambada_testing_ecommerce_playground\Tests> robot -d results tests_e-commerce_app.robot
#To run only tagged test cases use the following command: robot -d results -include HomePage tests_e-commerce_app.robot
#To perform a dry run where keywords coming from test libraries are not executed (used to validate test data run: robot -d results --dryrun tests_e-commerce_app.robot
#To use the "ExcludeTests" prerun modifier, use the following syntax:
#robot --prerunmodifier PythonScripts/ExcludeTests.py:*list tests_e-commerce_app.robot

*** Test Cases ***

User can land on the home page of the e-commerce app
    [Tags]    HomePage
    e-commerce_playground_app.Go to Home Page

User can search for an item through the search bar in the home page
    [Tags]    Searched item
    e-commerce_playground_app.Search for an item through the search bar in the home page

User can hover over the image displayed when searched item is retrieved and click on it
    [Tags]    Searched item
    e-commerce_playground_app.Search for an item through the search bar, hover over its image and click on the image

User can open the drop-down menu "All Categories", choose a category from the drop-down list and click on it
    [Tags]    All Categories
    e-commerce_playground_app.Open the drop-down menu and choose a category

User can click on the three icons on the top-right section of the home page
    [Tags]    Three icons
    e-commerce_playground_app.Click icons on the top-right part of the home page

User can click the "Shop by Category" link and access the categories contained in it
    [Tags]    Shop by Category
    e-commerce_playground_app.Click the Shop by Category link and access one of the categories

User can click each link in the nav bar and access relevant information
    [Tags]    Nav bar
    e-commerce_playground_app.Click each link in the nav bar

User can see the carousel change the web page main pictures automatically, alternate between them manually and click on each picture
    [Tags]    carousel
    e-commerce_playground_app.Assert that carousel work as expected and that main picture in the home page is clickable

User can click the "Shop Now" button and the two pictures related to it
    [Tags]    "Shop Now"
    e-commerce_playground_app.Click the first Shop Now button and the two images located below

User can click on each picture on the "Top Trending Categories" of the home page
    [Tags]    "Top Trending Categories"
    e-commerce_playground_app.Click the pics on the "Top trending categories" of the home page

User can click on the main picture in the "Top Trending Categories" section of the home page
    [Tags]    "Top Trending Categories"
    e-commerce_playground_app.Click the main pic in the "Top trending categories" section of the home page

User can click on the pictures on the "Top products" section of the page, switch between them with arrow buttons and access the menu options
    [Tags]    "Top products"
    e-commerce_playground_app.Click pics on the "Top Products" section of the page

User can click the second and third "Shop now" buttons
    [Tags]    "Shop now"
    e-commerce_playground_app.Click the second and third "Shop Now" button

User can click on options and pictures on the "Top collection" section of the page, switch between them with arrow buttons and access the menu options
    [Tags]    "Top collection"
    e-commerce_playground_app.Click links and pictures on the "Top collection" section of the page

User can click on the "Shop now" image below "Top Collection" sub-header
    [Tags]    "Shop now"
    e-commerce_playground_app.Click on the image below "Top Collection" sub header

User can click on the picture on the "Under @99" section of the page and access the menu options
    [Tags]    "Under @99"
    e-commerce_playground_app.Click links and pictures on the "Under @99" section of the page

User can click on the picture corresponding to one of the blogs and on the link related to the blog's author
    [Tags]    Blog
    e-commerce_playground_app.Click on picture and link to blog's author in the "From the blog" section of the page

