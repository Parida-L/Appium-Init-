*** Settings ***
Resource            ../resources/variables.resource
Resource            ../resources/libraries.resource
Resource            ../keywords/appium_keywords.robot

*** Keywords ***

I Launch The App
    [Documentation]    Launch the application.
    [Arguments]        ${app_package}    ${app_activity}
    #Log    Launching the app with package: ${app_package} and activity: ${app_activity}
    Start Appium Session    ${app_package}    ${app_activity}
    
The Logo Appears
    [Documentation]    Verify the logo appears.
    Wait Until Element Is Visible    //android.widget.TextView[@text="API Demos"]    timeout=5
    Wait Until Page Contains    text=API Demos    timeout=5

The Home Screen Should Be Visible
    [Documentation]    Verify the home screen is visible.
    Wait Until Element Is Visible    android:id/list    timeout=5
    
