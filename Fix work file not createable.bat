@echo off
echo Create backups of registry entries to delete in Downloads folder. . .
reg export "HKCR\CLSID\{84F66100-FF7C-4fb4-B0C0-02CD7FB668FE}" "%userprofile%\Downloads\SBLOG_RegBackup_WordPreview.reg"
reg export "HKCR\CLSID\{65235197-874B-4A07-BDC5-E65EA825B718}" "%userprofile%\documents\SBLOG_RegBackup_PowerPointreview.reg"
reg export "HKCR\CLSID\{00020827-0000-0000-C000-000000000046}" "%userprofile%\documents\SBLOG_RegBackup_ExcelPreview.reg"
echo.
echo Deleting entries. . .
reg delete "HKCR\CLSID\{84F66100-FF7C-4fb4-B0C0-02CD7FB668FE}" /f
reg delete "HKCR\CLSID\{65235197-874B-4A07-BDC5-E65EA825B718}" /f
reg delete "HKCR\CLSID\{00020827-0000-0000-C000-000000000046}" /f
echo.
echo Creating needed folders. . .
mkdir "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Content.Word"
mkdir "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCacheContent.Word"
echo.
echo Defining new registry entries for chache path. . .
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_SZ /d "%userprofile%\AppData\Local\Microsoft\Windows\INetCache" /f
echo.
echo Done. Please log off & on and try if the problem was resolved.
pause
