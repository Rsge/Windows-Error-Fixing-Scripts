@echo off
rd /s /q "%localappdata%\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy"
robocopy /e "C:\Users\Administrator\AppData\Local\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy" "%localappdata%\Packages\windows.immersivecontrolpanel_cw5n1h2txyewy"
echo Done.
pause
exit
