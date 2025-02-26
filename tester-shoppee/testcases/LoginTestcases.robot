*** Settings ***
Library         SeleniumLibrary
Resource        ../keywords/LoginPageKeywords.robot
Resource        ../keywords/HomePageKeywords.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml


*** Test Cases ***
As a user, I want to login success with valid credential
    Open Browser    ${baseUrl}    chrome
    When user login to future skill platform with ${email} and ${valid_password}
    Close Browser

As a user, I fail to login with invalid credential
    Open Browser    ${baseUrl}    chrome
    When user login to future skill platform with ${email} and ${invalid_password}
    Close Browser