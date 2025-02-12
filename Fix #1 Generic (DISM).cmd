@echo off
echo To apply the fixes of this script the PC has to be restarted afterwards.
pause
dism /online /cleanup-image /restorehealth
echo A restart is now needed now. Afterwards run Fix #2. Continue?
pause
shutdown /r /f /t 0
exit /b
