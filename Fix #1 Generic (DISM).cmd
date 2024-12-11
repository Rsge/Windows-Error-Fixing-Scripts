@echo off
echo This script will reboot your computer! Continue?
pause
dism /online /cleanup-image /restorehealth
shutdown /r /f /t 0
exit /b
