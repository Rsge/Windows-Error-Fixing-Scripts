# Windows error fixing scripts
A collection of scripts to fix various errors and inconveniences cropping up in Windows.\
These are made for running via double-clicking the scripts in file explorer.

* `Disable 3D Objects folder.reg` disables the 3D Objects folder in Quicklinks, This PC and in the navigation menu.
* `Disable AeroShake.reg` disables Windows AeroShake function for all users, which if you "shake" a window you are "holding", minimizes all other windows.
* `Disable Cortana & start menu Bing search.reg` disables the use of Cortana and the start menu searching on the internet via Bing for all users.
* `Disable Network folder.reg` disables the Network folder.
* `Disable News & Meet.reg` disables the "Meet now" button for all users and hides the News & Interests feed for the current one.
* `Disable OneDrive folder.reg` disables the OneDrive folder in Quicklinks, This PC and in the navigation menu.
* `Disable prompt for password change.cmd` disables the prompting for a password change when using a Microsoft account to log into Windows.
* `Fix blank icons.cmd` fixes desktop icons appearing as blank white rectangles instead of their usual icon. Adapted from the [ElevenForums](https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/) [[Archived link](https://web.archive.org/web/20211017173532/https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/)]
* `Fix edgegdi.dll.cmd` fixes the `edgegdi.dll` not being available for certain tasks, leading to errors thrown.
* `Fix long login times.cmd` deletes `WebCache`and `WebCacheLock.dat` on all normal users to fix unbearable login times after installing windows through a custom made image.
* `Fix Outlook Temp folder.cmd` empties the Temp folder of MS Office Outlook to fix it filling up the main harddrive.
* `Fix printer installation error 0x00000bcb.cmd` adds a temporary registry hack to fix error 0x00000bcb during printer install, then removes it again afterwards.
* `Fix printer not install- and selectable.cmd` fixes a problem where no printer can be selected or even installed, caused by corrupted files.
* `Fix search and settings.cmd` fixes the windows search and the settings app not starting up correctly and freezing.
* `Fix winmail.dat - Disable RTF & TNEF.reg` fixes the receiver of an email getting a `winmail.dat` file as attachment instead of a normal file by introducing a registry fix to keep Outlook from ever sending emails in RTF format or TNEF encryption.
* `Fix work file not createable.cmd` fixes the "Could not create the work file" error in Office.
* `Open network adapters.cmd` opens the network adapters settings of the "old" Control Panel.
* `Open printer folder.cmd` opens a folder in Explorer similiar to the Devices abd Printers settings, where printers can be added.
* `Open startup folder.cmd` opens the startup folder in Explorer.
* `Remove Java remains.cmd` removes remains of a Java installation after uninstall.
* `Remove Outlook profile.cmd` deletes all traces of a specified Outlook mail profile, so that a new profile of the same name can be created afterwards.
* `Set Outlook delegate sent items folder.reg` sets Outlook to put items sent from a delegate into that delegate's sent items folder.
* `Windows activation helper.cmd` shows you the product key of your current Windows installation to potentially resolve activation issues.