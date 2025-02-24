*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://shopee.co.th/buyer/login?gad_source=1&gclid=CjwKCAiAzvC9BhADEiwAEhtlN2LWKvmw3630-SebMHuDOq4m6WWMQRpjCEJHSiIR3sL1hELifP6VSRoC3voQAvD_BwE&next=https%3A%2F%2Fshopee.co.th%2F%3Fgad_source%3D1%26gclid%3DCjwKCAiAzvC9BhADEiwAEhtlN2LWKvmw3630-SebMHuDOq4m6WWMQRpjCEJHSiIR3sL1hELifP6VSRoC3voQAvD_BwE
${BROWSER}        Chrome
${USERNAME}       0634460809
${PASSWORD}       0641378222batzA#

*** Test Cases ***
Test Loginshoppee With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # เลือกภาษาไทย
    Click Element   xpath://button[contains(text(), 'ไทย')]  # เลือกภาษาไทยจากเมนู

    Input Text      name:loginKey   ${USERNAME}
    Input Text      name:password    ${PASSWORD}
    Click Button    xpath://button[contains(text(), 'เข้าสู่ระบบ')]

    # รอการโหลดหน้าเว็บให้เสร็จและตรวจสอบว่า CAPTCHA ปรากฏหรือไม่
    Wait Until Element Is Visible    id=NEW_CAPTCHA    timeout=15s

    Capture Page Screenshot
    Close Browser


Test Loginshoppee With Invalid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # เลือกภาษาไทย
    Click Element   xpath://button[contains(text(), 'ไทย')]  # เลือกภาษาไทยจากเมนู

    Input Text      name:loginKey   invalid_user
    Input Text      name:password    wrong_password
    Click Button    xpath://button[contains(text(), 'เข้าสู่ระบบ')]
    Wait Until Page Contains    บัญชีผู้ใช้นี้ไม่ได้อยู่ในประเทศนี้
    Capture Page Screenshot
    Close Browser