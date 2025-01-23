*** Settings ***
Resource            ../resources/variables.resource
Resource            ../resources/libraries.resource

*** Keywords ***

# GHERKIN KEYWORDS

I Have Opened The Calculator
    [Documentation]    Ouvrir l'application calculatrice.
    [Arguments]        ${app_package}    ${app_activity}
    Start Appium Session    ${app_package}    ${app_activity}

I Add ${number_1} And ${number_2}
    [Documentation]    Ajouter deux nombres.
    [Arguments]        ${num1}    ${num2}    
    Click Element      id=com.google.android.calculator:id/digit_${num1}
    Click Element      id=com.google.android.calculator:id/op_add
    Click Element      id=com.google.android.calculator:id/digit_${num2}
    Click Element      id=com.google.android.calculator:id/eq

I Subtract ${number_1} From ${number_2}
    [Documentation]    Soustraire deux nombres.
    [Arguments]        ${num1}    ${num2}
    Click Element      id=com.google.android.calculator:id/digit_${num1}
    Click Element      id=com.google.android.calculator:id/op_sub
    Click Element      id=com.google.android.calculator:id/digit_${num2}
    Click Element      id=com.google.android.calculator:id/eq

I Multiply ${number_1} By ${number_2}
    [Documentation]    Multiplier deux nombres.
    [Arguments]        ${num1}    ${num2}
    Click Element      id=com.google.android.calculator:id/digit_${num1}
    Click Element      id=com.google.android.calculator:id/op_mul
    Click Element      id=com.google.android.calculator:id/digit_${num2}
    Click Element      id=com.google.android.calculator:id/eq

I Divide ${number_1} By ${number_2}
    [Documentation]    Diviser deux nombres.
    [Arguments]        ${num1}    ${num2}
    Click Element      id=com.google.android.calculator:id/digit_${num1}
    Click Element      id=com.google.android.calculator:id/op_div
    Click Element      id=com.google.android.calculator:id/digit_${num2}
    Click Element      id=com.google.android.calculator:id/eq

The Result Should Be ${expected_result}
    [Documentation]    Vérifier le résultat.
    [Arguments]        ${expected_result}
    Wait Until Element Is Visible    id=com.google.android.calculator:id/result_final    timeout=5
    ${actual_result}=    Get Element Attribute    id=com.google.android.calculator:id/result_final    text
    Should Be Equal As Strings    ${actual_result}    ${expected_result}

Start Appium Session
    [Documentation]    Démarrer une session Appium en utilisant la configuration.
    [Arguments]    ${app_package}    ${app_activity}
    Open Application    ${APPIUM_SERVER}    
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}

Stop Appium Session
    [Documentation]    Arrêter la session Appium.
    Capture Page Screenshot
    Close Application       

