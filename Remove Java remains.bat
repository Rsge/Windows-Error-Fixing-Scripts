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
del "C:\Program Files (x86)\Common Files\Java\*" /s /q /f
reg query hklm\software\classes\installer\products /f "java(tm) 7" /s | find "HKEY_LOCAL_MACHINE" > deljava.txt
for /f "tokens=* delims= " %%a in (deljava.txt) do reg delete %%a /f
del deljava.txt
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\wow6432node\JavaSoft\Java Runtime Environment" /f
pause
exit
