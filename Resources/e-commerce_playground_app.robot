*** Settings ***
Resource   ./PO/HomePage/KeywordDefinitionFiles/navigate_and_search.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/drop-down_menu.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/click_icons.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/shop_by_category.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/nav_bar_links.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/click_on_main_pic.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/first_shop_now_link_and_two_images.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/top_trending_pics.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/top_products.robot
Resource   ./PO/HomePage/KeywordDefinitionFiles/second_and_third_shop_now_link.robot

*** Variables ***


*** Keywords ***

Go to Home Page
    navigate_and_search.Verify that the provided URL is accessible and that user can land on homepage

Search for an item through the search bar in the home page
    navigate_and_search.Verify that user can search for an item and retrieve it

Search for an item through the search bar, hover over its image and click on the image
    navigate_and_search.Verify that user can hover over the image that is displayed after text is inputted in the search bar

Open the drop-down menu and choose a category
    drop-down_menu.Verify that the drop-down menu works as expected and that items in the drop-down list are accessible

Click icons on the top-right part of the home page
    click_icons.Verify that the icons on the top-right part of the home page are clickable

Click the Shop by Category link and access one of the categories
    shop_by_category.Verify that the icons on the top-right part of the home page are clickable

Click each link in the nav bar
    nav_bar_links.Verify that each link in the nav bar is accessible

Assert that carousel work as expected and that main picture in the home page is clickable
    click_on_main_pic.Verify that carousel works as expected by automatically loops over three different pictures and that it is possible to click an image

Click the first Shop Now button and the two images located below
    first_shop_now_link_and_two_images.Verify that the first "Shop Now" link is clickable and that the two image below also are

Click the pics on the "Top trending categories" of the home page
    top_trending_pics.Verify that that pictures on the "Top Trending Categories" section of the page are clickable and accessible

Click pics on the "Top Products" section of the page
    top_products.Verify that that pictures on the "Top Products" section of the page are clickable and accessible

Click the second and third "Shop Now" button
    second_and_third_shop_now_link.Verify that the second and third "Shop Now" link are clickable
