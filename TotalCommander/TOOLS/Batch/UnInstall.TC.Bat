set tcpath=%commander_path%
cd %temp%
if exist uninstall.tc.bat null
"%tcpath%"\tools\nircmd.exe killprocess totalcmd.exe
"%tcpath%"\tools\nircmd.exe killprocess nircmd.exe
"%tcpath%"\tools\nircmd.exe killprocess akelpad.exe
"%tcpath%"\tools\nircmd.exe killprocess newfile.exe
"%tcpath%"\tools\nircmd.exe killprocess "tc log viewer.exe"
"%tcpath%"\tools\nircmd.exe execmd del "~$folder.desktop$\total commander.lnk" 2>nul
reg delete HKCU\Software\Akelsoft /f >nul 2>nul
rd "%temp%"\_tc /q /s
del "%temp%"\cmd*.tmp
rd "%tcpath%" /q /s
del %0
else
copy %0 %temp%
start "uninstall.tc.bat"
exit