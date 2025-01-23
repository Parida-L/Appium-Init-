*** Settings ***
Resource          ../resources/keywords/appium_keywords.robot

*** Test Cases ***
Launch Youtube
    [Documentation]    Lancer la calculatrice et effectuer des opérations de base.
    Start Appium Session    ${APP_PACKAGE_YT}    ${APP_ACTIVITY_YT}
