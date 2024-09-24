@echo off
chcp 65001 >nul 2>&1  
setlocal

set "success=0"  REM Flag to track success

set "userProfile=%USERPROFILE%"
set "jetBrainsPath=%userProfile%\AppData\Roaming\JetBrains"

if exist "%jetBrainsPath%" (
    rmdir /s /q "%jetBrainsPath%"
    if %ERRORLEVEL%==0 (
        set "success=1"
    ) else (
        echo Error: Failed to delete JetBrains folder. Error code: %ERRORLEVEL%.
    )
) else (
    echo JetBrains folder not found. Skipping deletion.
)

reg delete "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains" /f
if %ERRORLEVEL%==0 (
    set "success=1"
) else (
    echo Error: Failed to delete registry key 'jetbrains'. Error code: %ERRORLEVEL%.
)

reg delete "HKEY_CURRENT_USER\Software\JetBrains" /f
if %ERRORLEVEL%==0 (
    set "success=1"
) else (
    echo Error: Failed to delete registry keys for JetBrains. Error code: %ERRORLEVEL%.
)

if %success%==1 (
    echo Operation completed successfully.
) else (
    echo All operations failed.
)

endlocal
pause  

start https://github.com/g4rd7xRise/JB-Remove