*** Settings ***
Resource          ../resources/keywords/appium_keywords.robot
Resource          ../resources/keywords/apidemo_keywords.robot

*** Test Cases ***

# GHERKIN
Scenario: Launch And Verify The Home Screen
    [Documentation]   Test The App Launches Correctly And Verify The Home Screen Appears
    Given I Launch The APIDemos App
    When The Logo Appears
    Then The Home Screen Should Be Visible

Scenario: Interact With Views Menu Subsections 
    [Documentation]   Test The "Views" Menu Opens 
    Given I Launch The APIDemos App
    When I Interact With The Views Menu 
    Then Subsections Are Visible

Scenario: Interact With Custom Adapter Of The Expandable Lists
    [Documentation]   Test The "Views" Menu Opens And The Custom Adapter Is Visible
    Given I Launch The APIDemos App
    When I Interact With The Custom Adapter Of The Expandable Lists
    Then The People Names List Is Correct

Scenario: Verify The Expandability Of The Element
    [Documentation]   Test The "Views" Menu Opens And The Expandability Of The Element Is Verified
    Given I Interact With The Custom Adapter 
    When I Click On A Names List    @{DOG_NAMES_TO_CHECK}
    Then Corresponding Names Appears    @{DOG_NAMES_TO_CHECK}

Scenario: Interact With The Date Widget In The Dialog Mode 
    Given I Interact With The Date Widget Dialog Is Visible
    # When I Change The Date And Time
    # Then The Date And Time Should Be Updated Correctly

    # Given The Inline Date Widget Is Visible
    # When I Change The Date Using The Keyboard 
    # Then The Date And Time Should Be Updated Correctly