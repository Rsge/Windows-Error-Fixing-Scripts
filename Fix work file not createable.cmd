@echo off
REM Ensure Admin rights
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
net file 1>nul 2>nul
if '%errorlevel%' == '0' (goto gotPrivileges) else (goto getPrivileges)

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
REM If you have non-ASCII chars in your path you'll need to set the codepage appropriate to your locale:
REM chcp 1252
REM (ANSI-Latin1 - Western European, e.g. German)
cls
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "ELEV " >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args ^& strArg ^& " " >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit

:gotPrivileges
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul & shift /1)


REM Functional part
echo Create backups of registry entries to delete in Downloads folder. . .
reg export "HKCR\CLSID\{84F66100-FF7C-4fb4-B0C0-02CD7FB668FE}" "%userprofile%\Downloads\SBLOG_RegBackup_WordPreview.reg"
reg export "HKCR\CLSID\{65235197-874B-4A07-BDC5-E65EA825B718}" "%userprofile%\Downloads\SBLOG_RegBackup_PowerPointreview.reg"
reg export "HKCR\CLSID\{00020827-0000-0000-C000-000000000046}" "%userprofile%\Downloads\SBLOG_RegBackup_ExcelPreview.reg"
echo.
echo Deleting entries. . .
reg delete "HKCR\CLSID\{84F66100-FF7C-4fb4-B0C0-02CD7FB668FE}" /f
reg delete "HKCR\CLSID\{65235197-874B-4A07-BDC5-E65EA825B718}" /f
reg delete "HKCR\CLSID\{00020827-0000-0000-C000-000000000046}" /f
echo.
echo Creating needed folders. . .
mkdir "%USERPROfile%\AppData\Local\Microsoft\Windows\INetCache\Content.Word"
mkdir "%USERPROfile%\AppData\Local\Microsoft\Windows\INetCacheContent.Word"
echo.
echo Defining new registry entries for cache path. . .
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_SZ /d "%userprofile%\AppData\Local\Microsoft\Windows\INetCache" /f
echo.
echo Done. Please log off ^& on and see if the problem was resolved.
pause
exit
