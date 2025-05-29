*** Variables ***

${URL}     https://ecommerce-playground.lambdatest.io/index.php?route=common/home
${PreferredBrowser}     chrome
#${PreferredBrowser}     headlesschrome
${AccessRegistrationFormButton}  //a[@class="btn btn-primary"]
${InputTextLocatorFirstName}     //*[@id="input-firstname"]
${InputTextLocatorSurname}       //*[@id="input-lastname"]
${Email}                         //*[@id="input-email"]
${Telephone}                     //*[@id="input-telephone"]
${Password}                      //*[@id="input-password"]
${ConfirmPassword}               //*[@id="input-confirm"]
${RadioButton}                   //input[@name='newsletter']
${RadioButtonYesClicked}         document.getElementById('input-newsletter-yes').click();
${CheckListLocator}              document.getElementById('input-agree').click();
${PrivacyPolicy}                 //a[@class="agree"]
${PrivacyPolicyClose}            //*[@class="close"]
${ContinueButton}                //input[@class="btn btn-primary"]
${ContinueToMyAccountButton}     //a[@class="btn btn-primary"]
