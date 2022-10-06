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
rd /s /q "C:\Program Files (x86)\Common Files\Java\"
rd /s /q "C:\Program Files\Common Files\Java\"
reg query hklm\software\classes\installer\products /f "java(tm) 7" /s | find "HKEY_LOCAL_MACHINE" > deljava.txt
for /f "tokens=* delims= " %%a in (deljava.txt) do reg delete %%a /f
del deljava.txt
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\wow6432node\JavaSoft\Java Runtime Environment" /f
pause
exit
