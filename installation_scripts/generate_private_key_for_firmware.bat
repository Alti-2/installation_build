echo off

:: Call the environment setup script to variables etc.
CALL env_settings.bat %1

::Generate the private & public pair keys for Squawk
::You only need to do this once to generate the private-public key pair

if exist %PRIVATE_KEY% (
   cls
   echo.
    color 5F
   echo WARNING! The private key file already exists as: %PRIVATE_KEY%. It should be removed or saved under a difference name before proceding.
   echo.
   pause
)

COLOR

echo.

echo Generating private key file
nrfutil keys generate %PRIVATE_KEY%
echo.

echo Generating public key file: %PUBLIC_KEY%
nrfutil keys display --key pk --format code %PRIVATE_KEY% --out_file %PUBLIC_KEY%

echo.

IF %ERRORLEVEL% NEQ 0 (
    COLOR 47
)

pause
