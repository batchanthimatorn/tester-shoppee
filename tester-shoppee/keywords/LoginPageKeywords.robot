*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
user login to future skill platform with ${username} and ${password} 

    # เลือกภาษาไทย
    Click Element   xpath://button[contains(text(), 'ไทย')]  # เลือกภาษาไทยจากเมนู

    Input Text      name:loginKey   ${USERNAME}
    Input Text      name:password    ${PASSWORD}
    Click Button    xpath://button[contains(text(), 'เข้าสู่ระบบ')]



future skill should display display validate login fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text        ${expected_message}

