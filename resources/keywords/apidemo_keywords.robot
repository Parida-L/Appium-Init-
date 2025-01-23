*** Settings ***
Resource            ../resources/variables.resource
Resource            ../resources/libraries.resource
Resource            ../keywords/appium_keywords.robot

*** Keywords ***

I Launch The APIDemos App
    [Documentation]    Launch the application.
    #Log    Launching the app with package: ${app_package} and activity: ${app_activity}
    Start Appium Session    ${APP_ACTIVITY_API}    ${APP_ACTIVITY_API}
    
The Logo Appears
    [Documentation]    Verify the logo appears.
    Wait Until Element Is Visible    //android.widget.TextView[@text="API Demos"]    timeout=5
    Wait Until Page Contains    text=API Demos    timeout=5

The Home Screen Should Be Visible
    [Documentation]    Verify the home screen is visible.
    Wait Until Element Is Visible    android:id/list    timeout=5

I Interact With The Views Menu
    [Documentation]    Interact with the "Views" menu.
    Verify Subsections Are Visible
    Verify The Views Element
    


Subsections Are Visible
    [Documentation]    Verify the subsections "Expandable Lists" and "Date Widgets" are visible.
    Wait Until Element Is Visible    //android.widget.TextView[@text="Expandable Lists"]    timeout=5
    Wait Until Element Is Visible    //android.widget.TextView[@text="Date Widgets"]    timeout=5

Verify The Views Element
    [Documentation]    Verify the "Views" element is visible.
    Wait Until Page Contains    text=Views    timeout=5
    Wait Until Element Is Visible    //android.widget.TextView[@content-desc="Views"]    timeout=5
    Click Element    //android.widget.TextView[@content-desc="Views"]

