@echo off
net stop spooler
pushd "%~dp0\ScriptFiles\Printer not installable" && (
reg import "Printer Spooler Registry.reg"
robocopy spool C:\Windows\System32\spool *
)
popd
net start spooler
echo Done.
pause
exit