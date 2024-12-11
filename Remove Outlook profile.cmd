@echo off
setlocal
set /p name="Name of profile: "
set outlookLocalDir=%localappdata%\Microsoft\Outlook\
set outlookRoamingDir=%appdata%\Microsoft\Outlook\
set outlookReg=HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\
del /q /f %outlookRoamingDir%%name%.*
del /q /f %outlookLocalDir%*%name%*.*
reg delete "%outlookReg%Deleted Profiles\%name%" /f
reg delete "%outlookReg%Profiles\%name%" /f
pause
exit /b