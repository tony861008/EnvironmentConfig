..\addons\tcmc cmcm_CopyTrgPathToClip

if not exist "%programfiles%\winrar\winrar.exe" (goto checkrar) else if not exist "%programfiles%\winrar\default.sfx" (goto checkrar) else if not exist "%programfiles%\winrar\formats" (goto checkrar) else goto success1

:checkrar
if not exist "%commander_path%\tools\winrar\winrar.exe" (goto check7z1) else if not exist "%commander_path%\tools\winrar\default.sfx" (goto check7z1) else if not exist "%commander_path%\tools\winrar\formats" (goto check7z1) else goto success2

:check7z1
if not exist "%programfiles%\7-zip\7zg.exe" (goto check7z2) else if not exist "%programfiles%\7-zip\7z.dll" (goto check7z2) else goto success3

:check7z2
if not exist "%commander_path%\tools\7-zip\7zg.exe" (goto failure) else if not exist "%commander_path%\tools\7-zip\7z.dll" (goto failure) else goto success4

:success1
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Path" "%ProgramFiles%\WinRAR\WinRAR.exe"
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Params" "x -ad ~q~x25F~x25~q ~q~$clipboard$~q"
goto success

:success2
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Path" "%COMMANDER_PATH%\TOOLS\WinRAR\WinRAR.exe"
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Params" "x -ad ~q~x25F~x25~q ~q~$clipboard$~q"
goto success

:success3
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Path" "%ProgramFiles%\7-Zip\7zG.exe"
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Params" "x ~x25L~x25 -o~q~$clipboard$\*~q"
goto success

:success4
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Path" "%COMMANDER_PATH%\TOOLS\7-Zip\7zG.exe"
nircmd inisetval ..\addons\totaleditor\batchunpack.ini "UnpackArchives" "Params" "x ~x25L~x25 -o~q~$clipboard$\*~q"
goto success

:success
..\addons\tcmc emem_unpack
exit

:failure
cd "%commander_path%\tools"
nircmd infobox "使用快速解压需要 7-Zip 或 WinRAR.~n~n解决方法:~n1. 安装 7Zip 或 WinRAR~n~n2.  将以下文件分别放到:~n%COMMANDER_PATH%\TOOLS\7-Zip~n或~n%COMMANDER_PATH%\TOOLS\WinRAR~n~n所需文件:~n7Zip~t- 7z.DLL 和 7zG.EXE~nWinRAR~t- WinRAR.EXE 和 Formats 目录" "失败"
exit