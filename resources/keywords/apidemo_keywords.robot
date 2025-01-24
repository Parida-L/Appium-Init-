*** Settings ***
Resource            ../resources/variables.resource
Resource            ../resources/libraries.resource
Resource            ../keywords/appium_keywords.robot

*** Keywords ***

I Launch The APIDemos App
    [Documentation]    Launch the application.
    #Log    Launching the app with package: ${app_package} and activity: ${app_activity}
    Start Appium Session    ${APP_PACKAGE_API}    ${APP_ACTIVITY_API}    
    
The Logo Appears
    [Documentation]    Verify the logo appears.
    Wait Until Element Is Visible    //android.widget.TextView[@text="API Demos"]    timeout=5
    Wait Until Page Contains    text=API Demos    timeout=5

The Home Screen Should Be Visible
    [Documentation]    Verify the home screen is visible.
    Wait Until Element Is Visible    android:id/list    timeout=5

I Interact With The Views Menu
    [Documentation]    Interact with the "Views" menu.
    Verify The Views Element

Subsections Are Visible 
    [Documentation]    Verify the subsections "Expandable Lists" and "Date Widgets" are visible.
    Wait Until Page Contains Element    //android.widget.TextView[@content-desc="Views"]    timeout=5
    Click Element    //android.widget.TextView[@content-desc="Views"]
    Wait Until Element Is Visible    //android.widget.TextView[@text="Expandable Lists"]    timeout=5
    Wait Until Element Is Visible    //android.widget.TextView[@text="Date Widgets"]    timeout=5

I Interact With The Custom Adapter Of The Expandable Lists
    [Documentation]    Interact with the custom adapter of the "Expandable Lists" menu.
    Click Element    //android.widget.TextView[@content-desc="Views"]
    Wait Until Element Is Visible    //android.widget.TextView[@content-desc="Expandable Lists"]   timeout=5
    Click Element    //android.widget.TextView[@content-desc="Expandable Lists"]
    Wait Until Element Is Visible    //android.widget.TextView[@content-desc="1. Custom Adapter"]   timeout=5
    Click Element    //android.widget.TextView[@content-desc="1. Custom Adapter"]

The People Names List Is Correct
    [Documentation]    Verify the people names list is correct.
    Wait Until Element Is Visible    //android.widget.TextView[@text="People Names"]    timeout=5
    Click Element    //android.widget.TextView[@text="People Names"]
    @{expected_names}    Create List    Arnold    Barry    Chuck    David
    @{actual_names_elements}    Get Webelements    //android.widget.TextView
    ${actual_names}    Create List
    FOR    ${element}    IN    @{actual_names_elements}
        ${text}    Get Element Attribute    ${element}    text
        Append To List    ${actual_names}    ${text}
    END
    Log    Actual Names: ${actual_names}
    FOR    ${name}    IN    @{expected_names}
        Run Keyword If    '${name}' not in ${actual_names}    Fail    Name "${name}" not found in the list!
    END
    
# SOUS KEYWORDS 

Verify Subsections Are Visible
    [Documentation]    Verify the subsections "Expandable Lists" and "Date Widgets" are visible.
    Wait Until Element Is Visible    //android.widget.TextView[@text="Expandable Lists"]    timeout=5
    Wait Until Element Is Visible    //android.widget.TextView[@text="Date Widgets"]    timeout=5

Verify The Views Element
    [Documentation]    Verify the "Views" element is visible.
    Wait Until Page Contains    text=Views    timeout=5
    Wait Until Element Is Visible    //android.widget.TextView[@content-desc="Views"]    timeout=5
    Click Element    //android.widget.TextView[@content-desc="Views"]

Verify The Subsections Are Visible
    [Documentation]    Verify the subsections "Expandable Lists" and "Date Widgets" are visible.
    ${elements}=   Get WebElements   //android.widget.ListView[@resource-id="android:id/list"]//android.widget.TextView
    ${count}=      Get Length    ${elements}
    Log    Found ${count} items in the list.
    Should Be True    ${count} > 2    msg=Expected more than 2 items in the list

I Interact With The Custom Adapter 
    [Documentation]    Interact with the custom adapter of the "Expandable Lists" menu.
    I Launch The APIDemos App
    I Interact With The Custom Adapter Of The Expandable Lists

I Click On A Names List    
    [Documentation]    Click on a names list.
    [Arguments]    @{expected_names}
    Verify Names Do Not Appear    @{expected_names}
    Click Element    //android.widget.TextView[@text="Dog Names"]

Corresponding Names Appears
    [Documentation]    Verify the corresponding names appear.
    [Arguments]    @{expected_names}
    @{actual_names_elements}    Get Webelements    //android.widget.TextView
    ${actual_names}    Create List
    FOR    ${element}    IN    @{actual_names_elements}
        ${text}    Get Element Attribute    ${element}    text
        Append To List    ${actual_names}    ${text}
    END
    Log    Actual Names: ${actual_names}
    FOR    ${name}    IN    @{expected_names}
        Run Keyword If    '${name}' not in ${actual_names}    Fail    Name "${name}" not found in the list!
    END

Verify Names Do Not Appear
    [Documentation]    Verify that the names do not appear on the page.
    [Arguments]    @{names_to_check}
    FOR    ${name}    IN    @{names_to_check}
        Log    Verifying that "${name}" does not appear on the page.
        Wait Until Page Does Not Contain    ${name}    timeout=5
    END

Verify Names Do Appear 
    [Documentation]    Verify that the names appear on the page.
    [Arguments]    @{names_to_check}
    FOR    ${name}    IN    @{names_to_check}
        Log    Verifying that "${name}" appears on the page.
        Wait Until Page Contains    ${name}    timeout=5
    END

