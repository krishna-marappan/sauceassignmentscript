*** Settings ***
Documentation     Support keyword for Scenarios
...               Keywords created are based on http://robotframework.org/
Resource          ../Support_generic.robot

*** Keywords ***

user to launch saucedemo website
    [Documentation]   launch saucedemo website by url
    Open browser                        ${scaucedemourl}  chrome
    Maximize Browser Window
    Take Screenshot

user close all open browsers
    close browser


user login in to the saucedemo
    [Documentation]   login in to the saucedemo using username and password
    Replace xpath and Input Text        ${Input_Name}  user-name  ${username}
    Replace xpath and Input Text        ${Input_Name}  password  ${password}
    Take Screenshot
    Replace xpath and click Web         ${Input_Name}  login-button

user should be navigated to the Products page
    [Documentation]  verify the user navigated to the Products page
    ${url}                              Get Location
    ${status}=  Run Keyword And Return Status  Should Be Equal As Strings   ${url}  ${productpage}
    Run keyword if                      "${status}"=="True"
    ...  Log  User was navigated to the Products page
    Take Screenshot


user add a product to the cart which has the second least price
    [Documentation]  Add a product to the cart which has the second least price
    ${list}                            user able to get the list of price
    ${price}  ${index}                 Find the second least price and index  ${list}
    log                                The second lowest priced is ${price}
    ${name}  get text                  (${itemname})[${index}]
    log                                The second-lowest-priced product name is ${name}
    Set Test Variable                  ${prductname}   ${name}
    Take Screenshot
    ${res}  Replace String             ${buttontext}  replace  Add to cart
    click element                      (${res})[${index}]

user should be navigate to Cart Page
    [Documentation]  user should be navigate to Cart Page
    click element                      ${cartlink}
	${url}                             Get Location
    ${status}=  Run Keyword And Return Status  Should Be Equal As Strings   ${url}  ${cartpage}
    Run keyword if                     "${status}"=="True"
    ...  Log  User was navigated to the cart Page
    Take Screenshot

user Check out the product by entering details
    [Documentation]  Checking out the product by entering details
    ${res}                             Replace String  ${buttontext}  replace  Checkout
    click element                      ${res}
    Replace xpath and Input Text       ${Input_Name}  firstName   ${fisname}
    Replace xpath and Input Text       ${Input_Name}  lastName    ${lasname}
    Replace xpath and Input Text       ${Input_Name}  postalCode  ${poscode}
    Take Screenshot
    Replace xpath and click Web        ${Input_Name}  continue

user assert the Product details
    [Documentation]  verifying the product checkout detail(i.e :CHECKOUT: OVERVIEW and CHECKOUT: COMPLETE!) pages
    user able to verify if the selected product is checked out
    user able to get the total price after the tax
    user able to get the payment information
    Replace xpath and click Web       ${buttontext}  Finish
    user is able to verify that the thankyou page is displayed

#  support_web specific keyword

user able to get the list of price
    [Documentation]  Get the list of price in the product page
    @{pricelist}=  create list
    ${count}                          Get Element Count  ${itemprice}
    FOR  ${i}  IN RANGE  1  ${count}+1
    ${res}  Get text                  (${itemprice})[${i}]
    Append to list                    ${pricelist}  ${res}
    END
    [Return]  ${pricelist}

user able to verify if the selected product is checked out
    [Documentation]  verify the selected product
    ${status}  Validate field        ${itemname}  ${prductname}
    Run keyword if                   "${status}"=="True"
    ...  Log  The Selected product was checked out
    Take Screenshot

user is able to verify that the thankyou page is displayed
    [Documentation]  verify that the thankyou page
    Validate field                   ${title}    ${completetitle}
    Validate field                   ${header}   ${completeheader}
    ${status}  Validate field        ${thanyou}  ${completetext}
    Take Screenshot
    Run keyword if   "${status}"=="True"
    ...  Log  Thankyou page was displayed successfully
    Take Screenshot

user able to get the total price after the tax
    [Documentation]  total price after the tax
    Scroll Element Into View         ${totalcost}
    ${cost}                          get text  ${totalcost}
    log                              Price after tax is ${cost}
    Take Screenshot
    [Return]  ${cost}

user able to get the payment information
    [Documentation]  Payment information
    Scroll Element Into View         ${paymentinfo}
    ${res}                           get text  ${paymentinfo}
    log                              Payment information ${res}
    Take Screenshot
    [Return]  ${res}