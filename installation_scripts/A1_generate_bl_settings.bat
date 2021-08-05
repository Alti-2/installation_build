echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

nrfutil ^
settings generate ^
--family NRF52 ^
--application %APP_HEX_FILE% ^
--softdevice %SD_HEX_FILE% ^
--application-version %SES_BUILD_VERS_NBR% ^
--bootloader-version %SES_BUILD_VERS_NBR% ^
--bl-settings-version 2 ^
%BL_SETTING_HEX_FILE% > %OUTPUT_DIR%\generate_bl_settings_v%SES_BUILD_VERS_NBR%.log

echo.
IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
    pause
)

