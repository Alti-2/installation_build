echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

echo.

mergehex --merge ^
%BLSETTINGS_BOOTLOADER_MERGE_HEX_FILE% ^
%APP_HEX_FILE% ^
%SD_HEX_FILE% ^
--output %COMPLETE_MERGE_HEX_FILE%

echo.
IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
    PAUSE
)
