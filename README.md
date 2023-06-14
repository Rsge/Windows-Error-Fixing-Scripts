# Windows error fixing scripts
A collection of scripts to fix various errors and inconveniences cropping up in Windows.\
These are made for running via double-clicking the scripts in file explorer.

* `Disable AeroShake.reg` disables Windows AeroShake function for all users, which if you "shake" a window you are "holding", minimizes all other windows.
* `Disable Cortana & start menu Bing search.reg` disables the use of Cortana and the start menu searching on the internet via Bing for all users.
* `Disable News & Meet.reg` disables the "Meet now" button for all users and hides the News & Interests feed for the current one.
* `Fix Outlook Temp folder.cmd` empties the Temp folder of MS Office Outlook to fix it filling up the main harddrive.
* `Fix blank icons.cmd` fixes desktop icons appearing as blank white rectangles instead of their usual icon. Adapted from the [ElevenForums](https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/) [[Archived link](https://web.archive.org/web/20211017173532/https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/)]
* `Fix edgegdi.dll.cmd` fixes the `edgegdi.dll` not being available for certain tasks, leading to errors thrown.
* `Fix long login times.cmd` deletes `WebCache`and `WebCacheLock.dat` on all normal users to fix unbearable login times after installing windows through a custom made image.
* `Fix printer installation error 0x00000bcb.cmd` adds a temporary registry hack to fix error 0x00000bcb during printer install, then removes it again afterwards.
* `Fix printer not install- and selectable.cmd` fixes a problem where no printer can be selected or even installed, caused by corrupted files.
* `Fix prompt for password change.cmd` disables the prompting for a password change when using a Microsoft account.
* `Fix search and settings.cmd` fixes the windows search and the settings app not starting up correctly and freezing.
* `Fix winmail.dat - Disable RTF & TNEF.reg` fixes the receiver of an email getting a `winmail.dat` file as attachment instead of a normal file by introducing a registry fix to keep Outlook from ever sending emails in RTF format or TNEF encryption.
* `Fix work file not createable.cmd` fixes the "Could not create the work file" error in Office.
* `Remove Java remains.cmd` removes remains of a Java installation after uninstall.
* `Windows activation helper.cmd` shows you the product key of your current Windows installation to potentially resolve activation issues.