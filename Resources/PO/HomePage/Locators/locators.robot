*** Variables ***

${URL}     https://ecommerce-playground.lambdatest.io/index.php?route=common/home
#${PreferredBrowser}     headlesschrome
${SearchBox}           //input[@type='text']
${PreferredBrowser}     chrome
${SearchButton}   //button[text()='Search']
${SearchedItem}     //img[@alt="MacBook Pro"]
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
${TopTrendingCategoriesSection}   //*[@id="entry_217969"]
${TopTrendingItem}
${TopProductsSection}             //*[@id="entry_217978"]
${TopCollectionSection}           //*[@id="mz-product-listing-39217984"]
${TopCollectionUnorderListOptions}  //*[@class='nav nav-tabs nav-scroll mr-auto']//a
${TopCollectionPreviewButton}       //*[@class="mz-swiper-nav-prev"]
${TopCollectionNextButton}          //*[@class="mz-swiper-nav-next"]
${PicToHoverOver}                 //*[@id="mz-product-listing-image-37217979-0-0"]
${PicToHoverOverTopCollection}    //*[@id="mz-product-listing-image-39217984-2-2"]
${PicToClickTopCollection}        //*[@id="mz-product-listing-image-39217984-2-2"]
${ImageCartButton}                //button[@class='btn btn-cart cart-107']
${ImageCartButtonTopCollection}   document.querySelector('.btn.btn-cart.cart-29').click();
${CloseCartButton}                //*[@id="notification-box-top"]/div/div[1]/button
${ImageWishListButton}            //button[@title='Add to Wish List']
${ImageWishListBUttonTopCollection}     document.querySelector('.btn.btn-wishlist.wishlist-29').click();
${CloseWishListButton}            //*[@id="notification-box-top"]/div/div[1]/button
${ImageQuickViewButton}           //button[@title='Quick view']
${ImageQuickViewButtonTopcollection}    document.querySelector('.btn.btn-quick-view.quick-view-29').click();
${CloseImageQuickViewButton}      //*[@id="quick-view"]/div/div/button
${CompareImageButton}             //button[@title='Compare this Product']
${CompareImageButtonTopCollection}      document.querySelector('.btn.btn-compare.compare-29').click();
${CloseCompareImageButton}        //*[@id="notification-box-top"]/div/div[1]/button
${EditCartLink}         //a[contains(@class, 'icon-right both btn btn-primary btn-lg btn-block')]
${ShopNowImage}         //img[@alt='Apple Ipad Pro']
${Under99Image}         //a[@id='mz-product-listing-image-81217990-0-0']
${ImageCartButtonUnder99}   document.querySelector('.btn.btn-cart.cart-63').click();
${ImageWishListUnder99}     document.querySelector('.btn.btn-wishlist.wishlist-63').click();
${ImageQuickViewUnder99}     document.querySelector('.btn.btn-quick-view.quick-view-63').click()
${ImageCloseCompareUnder99}  document.querySelector('.btn.btn-compare.compare-63').click();
${FromTheBlog}  //*[@id='entry_217991']
${BloggerNameLocator}   //div[contains(@id, 'swiper-wrapper')]//span[1]/a
