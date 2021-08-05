@echo off

call A1_generate_bl_settings.bat
call B1_merge_blsettings-bootloader.bat NO
call B1_merge_blsettings-bootloader.bat NO
call B2_merge_blsettings-bootloader-softdevice.bat NO
call B3_merge_complete.bat NO
call D1_generate_bootloader_install_package.bat NO
call D2_generate_bootloader-softdevice_install_package.bat NO
call D3_generate_application_install_package.bat NO
call D4_generate_complete_install_package.bat NO

