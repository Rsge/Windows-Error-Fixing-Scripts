@echo off
set iconcache=%localappdata%\IconCache.db
set iconcache_x=%localappdata%\Microsoft\Windows\Explorer\iconcache*
echo.
echo The explorer process must be killed temporarily before deleting the IconCache.db file.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
echo.
if not exist "%iconcache%" if not exist "%iconcache_x%" (
	echo The IconCache files have already been deleted.
	pause
	exit /b
)

echo Attempting to delete IconCache.db files...
echo.
ie4uinit.exe -show
taskkill /f /im explorer.exe
If exist del /a /f /q "%iconcache%"
If exist del /a /f /q "%iconcache_x%"
start explorer.exe
echo IconCache database files have been successfully deleted.
echo.
echo You will need to restart the PC to finish rebuilding your icon cache.
choice /m "Do you want to restart the PC now?"
if %errorlevel% == 1 (
	shutdown /r /f /t 0
)
exit /b
