set tcpath=%commander_path%
cd "%tcpath%\tools"
nircmd closeprocess totalcmd.exe
nircmd closeprocess newfile.exe
nircmd closeprocess tcqsp.exe
nircmd closeprocess "tc log viewer.exe"
nircmd waitprocess totalcmd
nircmd exec show ..\totalcmd.exe
exit