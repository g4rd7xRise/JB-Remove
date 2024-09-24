@echo off
REM g4rd7xRise
set "userProfile=%USERPROFILE%"
set "jetBrainsPath=%userProfile%\AppData\Roaming\JetBrains"
if exist "%jetBrainsPath%" (
    rmdir /s /q "%jetBrainsPath%"
)

reg delete "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains" /f

reg delete "HKEY_CURRENT_USER\Software\JetBrains" /f