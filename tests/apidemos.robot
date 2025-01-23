*** Settings ***
Resource          ../resources/keywords/appium_keywords.robot
Resource          ../resources/keywords/apidemo_keywords.robot

*** Test Cases ***

# GHERKIN
Scenario: Launch and verify the home screen
    [Documentation]   Test the app launches correctly and verify the home screen appears
    Given I Launch The App    ${APP_PACKAGE_API}    ${APP_ACTIVITY_API}
    When The Logo Appears
    Then The Home Screen Should Be Visible

# Scenario: Interact with "Views" menu
#     [Documentation]   Test the "Views" menu opens 
#     Given I Launch The App    ${APP_PACKAGE_YT}    ${APP_ACTIVITY_YT}
#     When I Interact With The Views Menu 
#     Then 