*** Variables ***

${APPIUM_SERVER}       http://localhost:4723/wd/hub
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    15
${DEVICE_NAME}         emulator-5554
${AUTOMATION_NAME}     UiAutomator2
${APP_PACKAGE_YT}      com.google.android.youtube
${APP_ACTIVITY_YT}     com.google.android.youtube.app.honeycomb.Shell$HomeActivity  

# Calculator-specific
${APP_PACKAGE_CALC}    com.google.android.calculator
${APP_ACTIVITY_CALC}   com.android.calculator2.Calculator

&{NUMBER_1}            add=5    sub=2    mul=3    div=8  
&{NUMBER_2}            add=3    sub=7    mul=3    div=2
&{RESULT}              add=8    sub=−5    mul=9    div=4