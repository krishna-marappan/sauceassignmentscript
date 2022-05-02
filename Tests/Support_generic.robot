*** Settings ***
Documentation     Support for all generic keyword
...               Imports libraries and gets the setup ready for execution.
Library           SeleniumLibrary
Library           Screenshot
Library           String
Library           Collections
Library           ../Library/Support.py
Resource          ../Data/Data.robot
Resource          ../Data/Urls.robot
Resource          ../Data/Xpaths.robot

*** Variables ***
${screenshotCount}    1

*** Keywords ***

Replace xpath and Input Text
    [Documentation]  Replace Text and Input
    [Arguments]                         ${xpath}  ${value}  ${value1}
    ${res}         					    Replace String	 ${xpath}	 replace 	${value}
    Scroll Element Into View            ${res}
    Input Text                          ${res}  ${value1}

Replace xpath and click Web
    [Documentation]   Replace xpath and click Button
    [Arguments]                         ${xpath}  ${Name}
    ${Result}                           Replace String	 ${xpath} 	replace 	${Name}
    Scroll Element Into View            ${Result}
    Click Element                       ${Result}

Validate field
	[Documentation]	 Validate field value
	[Arguments]							${Value1}  ${Value2}
	Scroll Element Into View            ${Value1}
	${response}  Get Text               ${Value1}
    ${status}=  Run Keyword And Return Status  Should Be Equal As Strings  ${response}  ${Value2}
    [Return]    ${status}

Take Screenshot
    [Documentation]  Taking screenshot at Test Level
    Capture page screenshot             ${OUTPUTDIR}${/}${screenshot_dir}${/}${TEST NAME}_${screenshotCount}.png
    ${screenshotCount}                  Evaluate  ${screenshotCount}+1
	Set global variable                 ${screenshotCount}
