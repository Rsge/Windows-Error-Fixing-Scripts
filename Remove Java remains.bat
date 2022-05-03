@echo off
del "C:\Program Files (x86)\Common Files\Java\*" /s /q /f
reg query hklm\software\classes\installer\products /f "java(tm) 7" /s | find "HKEY_LOCAL_MACHINE" > deljava.txt
for /f "tokens=* delims= " %%a in (deljava.txt) do reg delete %%a /f
del deljava.txt
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\wow6432node\JavaSoft\Java Runtime Environment" /f
pause
exit
