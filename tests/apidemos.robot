*** Settings ***
Resource          ../resources/keywords/appium_keywords.robot
Resource          ../resources/keywords/apidemo_keywords.robot

*** Test Cases ***

# GHERKIN
Scenario: Launch and verify the home screen
    [Documentation]   Test the app launches correctly and verify the home screen appears
    Given I Launch The APIDemos App
    When The Logo Appears
    Then The Home Screen Should Be Visible

Scenario: Interact with "Views" menu subsections 
    [Documentation]   Test the "Views" menu opens 
    Given I Launch The APIDemos App
    When I Interact With The Views Menu 
    Then Subsections Are Visible

# Scenario: Interact with custom adapter
#     [Documentation]   Test the "Views" menu opens and the custom adapter is visible
#     Given I Launch The APIDemos App
#     When I Interact With The Views Menu 
#     Then Subsections Are Visible