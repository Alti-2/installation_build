echo off

SET "APP_BUILD_TYPE=debug"

SET "DEVICE_ID=mercury"

::************************************************
:: The stuff below MAY change depending on options
::************************************************
SET "APP_HEX_FILE_PATH=..\..\UI_Main\Output\%APP_BUILD_TYPE%\Exe"
SET "APP_HEX_FILE_NAME=app_%DEVICE_ID%_v%SES_BUILD_VERS_NBR%.hex"

SET "BL_HEX_FILE_PATH=.."
SET "BL_HEX_FILE_NAME=secure_bootloader_mercury.hex"

SET "SD_HEX_FILE_PATH=..\..\Nordic-Semiconductor-NRF5-SDK\components\softdevice\s132\hex"
SET "SD_HEX_FILE_NAME=s132_nrf52_6.1.1_softdevice.hex"

:: 0xB7 = S132_nrf52_6.1.1 (Prev SD id and the new SD id will only differ when updating the SD.
SET "PREV_SD_ID= 0xB7"
SET "CURR_SD_ID= 0xB7"

::************************************************
:: The stuff below should not have to be changed.
::************************************************

SET "OUTPUT_DIR=..\v%SES_BUILD_VERS_NBR%"

SET "PRIVATE_KEY=..\key_files\%DEVICE_ID%_private.key"
SET "PUBLIC_KEY=..\key_files\%DEVICE_ID%_public_key.c"

SET "APP_HEX_FILE=%APP_HEX_FILE_PATH%\%APP_HEX_FILE_NAME%"
SET "BL_HEX_FILE=%BL_HEX_FILE_PATH%\%BL_HEX_FILE_NAME%"
SET "SD_HEX_FILE=%SD_HEX_FILE_PATH%\%SD_HEX_FILE_NAME%"

SET "BL_SETTING_HEX_FILE=%OUTPUT_DIR%\%DEVICE_ID%_bl_settings_v%SES_BUILD_VERS_NBR%.hex"

SET "BLSETTINGS_BOOTLOADER_MERGE_HEX_FILE=%OUTPUT_DIR%\%DEVICE_ID%_merged_blsettings-bootloader_v%SES_BUILD_VERS_NBR%.hex"
SET "BLSETTINGS_BOOTLOADER_SOFTDEVICE_MERGE_HEX_FILE=%OUTPUT_DIR%\%DEVICE_ID%_merged_blsettings-bootloader-softdevice_v%SES_BUILD_VERS_NBR%.hex"
SET "COMPLETE_MERGE_HEX_FILE=%OUTPUT_DIR%\%DEVICE_ID%_merged_complete_v%SES_BUILD_VERS_NBR%.hex"

SET "DFU_BL_PACKAGE_FILE=%OUTPUT_DIR%\%DEVICE_ID%_install_bootloader_pkg_v%SES_BUILD_VERS_NBR%.zip"
SET "DFU_BL_SD_PACKAGE_FILE=%OUTPUT_DIR%\%DEVICE_ID%_install_bootloader-softdevice_pkg_v%SES_BUILD_VERS_NBR%.zip"
SET "DFU_APP_PACKAGE_FILE=%OUTPUT_DIR%\%DEVICE_ID%_install_application_pkg_v%SES_BUILD_VERS_NBR%.zip"
SET "DFU_COMPLETE_PACKAGE_FILE=%OUTPUT_DIR%\%DEVICE_ID%_install_complete_pkg_v%SES_BUILD_VERS_NBR%.zip"

SET "SOFTWARE_DEPOT_BASE=D:\OneDrive - Alti-2 Inc"

::===========================================================================================
:: IF the output directory does not exist then create it
IF NOT EXIST %OUTPUT_DIR% (
   mkdir  %OUTPUT_DIR%
)


::===========================================================================================
::===========================================================================================

echo.
echo **********************************************************
echo Verify settings before continuing...
echo.
echo Output directory: %OUTPUT_DIR%
echo.
echo Application build type: %APP_BUILD_TYPE%
echo Application version number: %SES_BUILD_VERS_NBR%
echo Private key: %PRIVATE_KEY%
echo Public key: %PUBLIC_KEY%
echo Previous SD ID version: %PREV_SD_ID%
echo Current SD ID version: %CURR_SD_ID%
echo.
echo Application: %APP_HEX_FILE%
echo Bootloader settings file: %BL_SETTING_HEX_FILE%
echo Bootloader: %BL_HEX_FILE%
echo Softdevice file: %SD_HEX_FILE%
echo.
echo Merged BLsettings-bootloader: %BLSETTINGS_BOOTLOADER_MERGE_HEX_FILE%
echo Merged BLsettings-bootloader-softdevice: %BLSETTINGS_BOOTLOADER_SOFTDEVICE_MERGE_HEX_FILE%
echo Merged complete: %COMPLETE_MERGE_HEX_FILE%
echo.
echo Bootloader package file: %DFU_BL_PACKAGE_FILE%
echo Bootloader-softdevice package file: %DFU_BL_SD_PACKAGE_FILE%
echo Application package file: %DFU_APP_PACKAGE_FILE%
echo Complete package file: %DFU_COMPLETE_PACKAGE_FILE%
echo.
echo **********************************************************


IF NOT "%1" EQU "NO" (
   pause
)


