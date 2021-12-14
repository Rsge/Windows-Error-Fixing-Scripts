# Windows-Error-Fixing-Scripts
A collection of scripts to fix various errors cropping up in Windows.

* `Fix Outlook Temp folder.bat` empties the Temp folder of MS Office Outlook to fix it filling up the main harddrive.
* `Fix edgegdi.dll.bat` fixes the `edgegdi.dll` not being available for certain tasks, leading to errors thrown.
* `Fix long login times.bat` deletes `WebCache`and `WebCacheLock.dat` on all normal users to fix unbearable login times after installing windows through a custom made image.
* `Fix printer not install- and selectable.bat` fixes a problem where no printer can be selected or even installed, caused by corrupted files.
* `Fix search & settings.bat` fixes the windows search and the settings app not starting up correctly and freezing.
* `Fix winmail.dat - Disable RTF & TNEF.reg` fixes the receiver of an email getting a `winmail.dat` file as attachment instead of a normal file by introducing a registry fix to keep Outlook from ever sending emails in RTF format or TNEF encryption.
