*** Settings ***
Resource  ../main.robot

*** Keywords ***
Open App
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-web-security
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-logging
    Call Method    ${options}    add_argument    --enable-automation
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-browser-side-navigation
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --safebrowsing-disable-download-protection
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --acceptSslCerts
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    IF  ${headless}
        ${ws}          set variable  window-size=1920,1080
        Call Method    ${options}    add_argument    --${ws}
        Call Method    ${options}    add_argument    --headless
    END
    ${ws}          set variable  window-size=1366,768
    Call Method    ${options}    add_argument    --${ws}

    ${url}  Set Variable  ${links.base}
    Set Global Variable    ${url}
    
    Open Browser    https://www.facebook.com/login/device-based/regular/login/?login_attempt=1    chrome    options=${options}

    Efetuar Login


Fechar Navegador
    Close Browser

Evidênciar teste
    Capture Page Screenshot                                      
Efetuar Login
            Wait Element    ${login.input_email}
            Input    ${login.input_email}      %{user}
            Input    ${login.input_senha}      %{senha}
            Click    ${login.btn_login}
            Sleep    15
            Go to    ${url}       
    ${status}    Run Keyword And Return Status    Wait Element    ${login.input_email}    10
    IF    ${status}
            Input    ${login.input_email}      ${user}
            Input    ${login.input_senha}      ${senha}
            Click    ${login.btn_login}
            Sleep    15
            Go to    ${url}
    END
    Wait Element    ${post.btn_mudar_conta} 
    Click           ${post.btn_mudar_conta}
    Sleep    3
    Wait Element    ${post.btn_efetuar_post}


Wait Element
    [Arguments]  ${locator}  ${timeout}=${default_timeout}  ${vanish}=False
    IF  ${vanish}
        Wait Until Element Is Not Visible  ${locator}  ${timeout}
    ELSE
        Wait Until Element Is Visible  ${locator}  ${timeout}
    END

Click
    [Arguments]  ${locator}  ${wait}=False  ${wait_time}=${interract_timeout}  ${sleep}=0  ${extra_time}=600
    Wait Element  ${locator}  ${wait_time}
    Scroll Element Into View  ${locator}
    Click Element  ${locator}
    IF  ${take_print}
        Sleep    0.5
    END
    IF  ${wait}
        Sleep    0.5
    END
    IF  ${sleep} > 0
        Sleep  ${sleep}
    END

Get Input value
    [Arguments]  ${locator}
    ${text}  Get Text  ${locator}
    ${value}  Get Element Attribute    ${locator}    value
    ${content}  Set Variable If    len($text) > 0  ${text}  ${value}
    [Return]  ${content}

Input
    [Arguments]  ${locator}  ${message}  ${clear}=True  ${tab}=True  ${wait}=False  ${wait_time}=${interract_timeout}  ${sleep}=0
    Wait Element  ${locator}  ${wait_time}
    Scroll Element Into View  ${locator}
    ${value}  Get Input value  ${locator}
    ${size}  Get Length    ${value}
    ${clean}  Set Variable  ${EMPTY}
    ${next}  Set Variable  ${EMPTY}
    IF  ${size} > 0
        ${clean}  Set Variable  CTRL+A+BACKSPACE
    END
    IF  ${tab}
        ${next}  Set Variable  TAB
    END
    Press Keys  ${locator}  ${clean}  ${message}  ${next}
    IF  ${take_print}
        Sleep    0.5
    END
    IF  ${wait}
        Sleep    0.5
    END
    IF  ${sleep} > 0
        Sleep  ${sleep}
    END