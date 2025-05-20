*** Variables ***

#   Choose preferred browser and open the web application under test with it

${URL}     https://ecommerce-playground.lambdatest.io/index.php?route=common/home
#${PreferredBrowser}     headlesschrome
${PreferredBrowser}     chrome
${SearchButton}   //button[text()='Search']
${Drop-downMenuButton}  //button[@class='btn dropdown-toggle']
${Drop-downLinks}    //a[contains(@class, 'dropdown-item')]
${ItemToSelectFromDrop-down}  //a[contains(@data-category_id, '20')]
${ImageToClick}   //img[@alt="MacBook Pro"]
${CompareIcon}   //a[contains(@aria-label, 'Compare')]
${WishListicon}   //a[contains(@aria-label, 'Wishlist')]
${CartIcon}       //a[contains(@class, 'cart text-reset text-decoration-none no-title')]
${ShopByCategoryLink}    //a[contains(@class, 'icon-left both text-reset')]
${ComponentsCategory}    //a[contains(text(), 'Components')]
${CategoriesWidgetContainer}  //*[@id="widget-navbar-217841"]//a[contains(., 'Components')]
${HomePageMainPic}    //img[@alt="Iphone 11 pro max"]
${FirstShopNowButton}     //a[contains(@class, 'btn btn-lg btn-outline-primary ml-lg-auto flex-shrink-0')]
${SecondShopNowButton}    //a[contains(@class, 'btn btn-outline-primary btn-lg')]
${ThirdShopNowButton}     //a[contains(@class, 'btn btn-lg btn-outline-primary flex-shrink-0 ml-md-auto')]
${ScrollIntoViewAfterClickingShopNow}   //*[@id="entry_217980"]
${ScrollIntoViewAfterClickingShopNow2}  //*[@id="entry_217983"]
${Iphone 11 pro max}     //img[@alt='Iphone 11 pro max']
${Microsoft smartwatch}    //img[@alt='Microsoft smartwatch']
${Canon DSLR camera}       //img[@alt='Canon DSLR camera']
${TopTrendingCategoriesSection}   //*[@id="mz-category-wall74217970"]
${TopProductsSection}             //*[@id="entry_217978"]
${PicToHoverOver}                 //*[@id="mz-product-listing-image-37217979-0-0"]
${ImageCartButton}                //button[@class='btn btn-cart cart-107']
${CloseCartButton}                //*[@id="notification-box-top"]/div/div[1]/button
${ImageWishListButton}            //button[@title='Add to Wish List']
${CloseWishListButton}            //*[@id="notification-box-top"]/div/div[1]/button
${ImageQuickViewButton}           //button[@title='Quick view']
${CloseImageQuickViewButton}      //*[@id="quick-view"]/div/div/button
${CompareImageButton}             //button[@title='Compare this Product']
${CloseCompareImageButton}        //*[@id="notification-box-top"]/div/div[1]/button
