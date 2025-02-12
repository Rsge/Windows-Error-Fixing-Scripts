@echo off
rem Ensure Admin rights
setlocal disabledelayedexpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal enabledelayedexpansion
net file 1>nul 2>nul
if %errorlevel% == 0 (goto gotPrivileges) else (goto getPrivileges)

:getPrivileges
if '%1' == 'ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
rem If you have non-ASCII chars in your path you'll need to set the codepage appropriate to your locale:
rem chcp 1252
rem (ANSI-Latin1 - Western European, e.g. German)
cls
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "ELEV " >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args ^& strArg ^& " " >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /b

:gotPrivileges
if '%1' == 'ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul & shift /1)


rem Functional part
rd /s /q "%localappdata%\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy"
robocopy /e "C:\Users\Administrator\AppData\Local\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy" "%localappdata%\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy"
echo Done.
pause
exit /b
