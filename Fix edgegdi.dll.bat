@echo off
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
