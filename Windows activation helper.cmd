@echo off
echo Input the following key at "Activate/Change Key":
wmic path softwarelicensingservice get OA3xOriginalProductKey
pause
exit /b
