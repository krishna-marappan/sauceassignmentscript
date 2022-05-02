*** Settings ***
Documentation    Website Xpaths

*** Variables ***

# Generic
${Input_Name}       //input[@name="replace"]
${buttontext}       //button[text()="replace"]

# Application Specific
${itemprice}        //div[@class="inventory_item_price"]
${itemname}         //div[@class="inventory_item_name"]
${cartlink}         //a[@class="shopping_cart_link"]
${totalcost}        //div[@class="summary_total_label"]
${paymentinfo}      //div[@class="summary_value_label"]
${title}            //span[@class="title"]
${header}           //h2[@class="complete-header"]
${thanyou}          //div[@class="complete-text"]
