*** Settings ***
Documentation       Saucedemo website Testing using python robotframework
...                 "https://www.saucedemo.com/"
Test Teardown       Close all Browsers
Resource            ../Supportsteps/Support_Web.robot


*** Test Cases ***
ZUCITECH_TC001
    [Documentation]   Test Objective:To check out the product and assert the Product details at the end
    [Tags]   Test1  assignment1
    Given user to launch saucedemo website
    And user login in to the saucedemo
    When user should be navigated to the Products page
    Then user add a product to the cart which has the second least price
    When user should be navigate to Cart Page
    Then user Check out the product by entering details
    Then user assert the Product details
    And user close all open browsers
