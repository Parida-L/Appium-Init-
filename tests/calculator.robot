*** Settings ***
Resource          ../resources/keywords/appium_keywords.robot

*** Test Cases ***

Scenario: Addition
    [Documentation]    Add two numbers
    Given I Have Opened The Calculator    ${APP_PACKAGE_CALC}    ${APP_ACTIVITY_CALC}   
    When I Add ${number_1} And ${number_2}    ${NUMBER_1}[add]    ${NUMBER_2}[add]
    Then The Result Should Be ${result}    ${RESULT}[add]

Scenario: Subtraction
    [Documentation]    Subtract two numbers
    Given I Have Opened The Calculator    ${APP_PACKAGE_CALC}    ${APP_ACTIVITY_CALC}   
    When I Subtract ${number_1} From ${number_2}    ${NUMBER_1}[sub]    ${NUMBER_2}[sub]
    Then The Result Should Be ${result}    ${RESULT}[sub]

Scenario: Multiplication
    [Documentation]    Multiply two numbers
    Given I Have Opened The Calculator    ${APP_PACKAGE_CALC}    ${APP_ACTIVITY_CALC} 
    When I Multiply ${number_1} By ${number_2}    ${NUMBER_1}[mul]    ${NUMBER_2}[mul]
    Then The Result Should Be ${result}    ${RESULT}[mul]

Scenario: Division
    [Documentation]    Divide two numbers
    Given I Have Opened The Calculator    ${APP_PACKAGE_CALC}    ${APP_ACTIVITY_CALC} 
    When I Divide ${number_1} By ${number_2}    ${NUMBER_1}[div]    ${NUMBER_2}[div]
    Then The Result Should Be ${result}    ${RESULT}[div]