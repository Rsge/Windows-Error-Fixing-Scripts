@echo off
REM Ensure Admin rights
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>nul 2>nul
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "ELEV " >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args ^& strArg ^& " " >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul & shift /1)


REM Functional part
robocopy "C:\Windows\SysWOW64" "%localappdata%\Temp" EdgeManager.dll
ren "%localappdata%\Temp\EdgeManager.dll" "edgegdi.dll"
robocopy "%localappdata%\Temp" "C:\Windows\SysWOW64" "edgegdi.dll"
del "%localappdata%\Temp\edgegdi.dll"


robocopy "C:\Windows\System32" "%localappdata%\Temp" EdgeManager.dll
ren "%localappdata%\Temp\EdgeManager.dll" "edgegdi.dll"
robocopy "%localappdata%\Temp" "C:\Windows\System32" "edgegdi.dll"
del "%localappdata%\Temp\edgegdi.dll"

echo Done.
pause
exit
