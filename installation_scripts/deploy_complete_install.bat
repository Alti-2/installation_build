
this is busted.

echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

echo.

erase


install n



verify

reset


echo.
IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
)

IF NOT "%1" EQU "NO" (
   pause
)
