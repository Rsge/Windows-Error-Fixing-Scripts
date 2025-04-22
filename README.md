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
* `Fix #1 Generic (DISM).cmd` runs dism for generic error correction. Always run `Fix #2` after! Otherwise it's useless.
* `Fix #2 Generic (SFC).cmd` runs sfc for generic error correction (and buys time for actual research ;]). Can be used w/o running `Fix #1` first.
* `Fix blank icons.cmd` fixes desktop icons appearing as blank white rectangles instead of their usual icon. Adapted from the [ElevenForums](https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/) [[Archived link](https://web.archive.org/web/20211017173532/https://www.elevenforum.com/t/rebuild-icon-cache-in-windows-11.2049/)]
* `Fix edgegdi.dll.cmd` fixes the `edgegdi.dll` not being available for certain tasks, leading to errors thrown.
* `Fix long login times.cmd` deletes `WebCache`and `WebCacheLock.dat` on all normal users to fix unbearable login times after installing windows through a custom made image.
* `Fix Outlook Temp folder.cmd` empties the Temp folder of MS Office Outlook to fix it filling up the main harddrive.
* `Fix printer installation error 0x00000bcb.cmd` adds a temporary registry hack to fix error 0x00000bcb during printer install, then removes it again afterwards.
* `Fix printer not install- and selectable.cmd` fixes a problem where no printer can be selected or even installed, caused by corrupted files.
* `Fix search and settings.cmd` fixes the windows search and the settings app not starting up correctly and freezing.
* `Fix winmail.dat - Disable RTF & TNEF.reg` fixes the receiver of an email getting a `winmail.dat` file as attachment instead of a normal file by introducing a registry fix to keep Outlook from ever sending emails in RTF format or TNEF encryption.
* `Fix work file not createable.cmd` fixes the "Could not create the work file" error in Office.
* `Open device manager.cmd` opens the device manager. (No shit! o.O)
* `Open group policy overview.cmd` opens an overview for the currently applied group policies of the current user and PC.
* `Open network adapters.cmd` opens the network adapters settings of the Control Panel.
* `Open printer settings.cmd` opens the Devices and Printers settings of the Control Panel.
* `Open reliability monitor.cmd` opens the reliability monitor, a better way to view the event log than the actual Event Log.
* `Open startup folder.cmd` opens the startup folder in Explorer.
* `Open system settings.cmd` opens the advanced system properties and settings.
* `Remove Java remains.cmd` removes remains of a Java installation after uninstall.
* `Remove Outlook profile.cmd` deletes all traces of a specified Outlook mail profile, so that a new profile of the same name can be created afterwards.
* `Set Outlook delegate sent items folder.reg` sets Outlook to put items sent from a delegate into that delegate's sent items folder.
* `Windows activation helper.cmd` helps to activate Windows by showing the registered product key and, if unsuccessful, provides alternative solutions.