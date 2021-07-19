
this is busted. 

echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

echo.

IF /I "%APP_BUILD_TYPE%" EQU "DEBUG_TESTING_FIXBACK" (
    nrfutil pkg generate --DEBUG_TESTING_FIXBACK-mode --hw-version 52 --application-version %SES_BUILD_VERS_NBR% --application %BLSETTINGS_BOOTLOADER_MERGE_HEX_FILE% --sd-req 0xB7 --sd-id 0xB7 --key-file %PRIVATE_KEY% %DFU_BL_PACKAGE_FILE%
) ELSE (
    nrfutil pkg generate --hw-version 52 --application-version %SES_BUILD_VERS_NBR% --application %BLSETTINGS_BOOTLOADER_MERGE_HEX_FILE% --sd-req 0xB7 --sd-id 0xB7 --key-file %PRIVATE_KEY% %DFU_BL_PACKAGE_FILE%
)

echo.
IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
)

IF NOT "%1" EQU "NO" (
   pause
)
