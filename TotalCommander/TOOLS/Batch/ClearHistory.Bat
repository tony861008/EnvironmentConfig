cd %commander_path%\user
..\tools\nircmd closeprocess totalcmd.exe
..\tools\nircmd closeprocess newfile.exe
..\tools\nircmd closeprocess tcqsp.exe
..\tools\nircmd closeprocess "tc log viewer.exe"
..\tools\nircmd waitprocess totalcmd
del history.ini
del tclog.txt
del *.br2
del tcftp.log
rd "%temp%"\_tc /q /s
del "%temp%"\cmd*.tmp
reg delete HKCU\Software\Akelsoft /f >nul 2>nul
..\tools\nircmd exec show ..\totalcmd.exe
exit