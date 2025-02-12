@echo off
setlocal enabledelayedexpansion
echo Input the following key at "Activate/Change Key":
wmic path softwarelicensingservice get OA3xOriginalProductKey
choice /m "Did this work"
if %errorlevel% == 2 (
	echo.
	echo Try this one:
	echo FCKGW-RHQQ2-YXRKT-8TG6W-2B7Q8
	echo.
	echo Alternatively, you can use an external activation script from "get.activated.win".
	choice /m "Run that script"
	if !errorlevel! == 1 (
		powershell -command "Invoke-RestMethod https://get.activated.win | Invoke-Expression"
	)
)
exit /b
