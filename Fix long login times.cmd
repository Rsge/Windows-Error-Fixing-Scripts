@echo off
rem Ensure Admin rights
setlocal disabledelayedexpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal enabledelayedexpansion
net file 1>nul 2>nul
if %errorlevel% == 0 (goto gotPrivileges) else (goto getPrivileges)

:getPrivileges
if '%1' == 'ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
rem If you have non-ASCII chars in your path you'll need to set the codepage appropriate to your locale:
rem chcp 1252
rem (ANSI-Latin1 - Western European, e.g. German)
cls
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "ELEV " >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args ^& strArg ^& " " >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /b

:gotPrivileges
if '%1' == 'ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul & shift /1)


rem Functional part
pushd "C:\Users" && (
	for /f "tokens=*" %%a in ('dir /a:d /b') do (
		if not "%%a" == "Public" if not "%%a" == "All Users" if not "%%a" == "Default User" (
			pushd "C:\Users\%%a\AppData\Local\Microsoft\Windows" && (
				rd /s /q WebCache
				del /q /f WebCacheLock.dat
				popd
			)
		)
	)
	popd
)
echo Done.
pause
exit /b
