echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

echo.

mergehex --merge ^
%BL_SETTING_HEX_FILE% ^
%BL_HEX_FILE% ^
%SD_HEX_FILE% ^
--output %BLSETTINGS_BOOTLOADER_SOFTDEVICE_MERGE_HEX_FILE%

echo.
IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
    PAUSE
)
