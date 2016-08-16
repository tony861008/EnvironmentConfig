cd %commander_path%\tools

if not exist "%programfiles%\winrar\winrar.exe" (goto checkrar) else if not exist "%programfiles%\winrar\default.sfx" (goto checkrar) else goto success1

:checkrar
if not exist "%commander_path%\tools\winrar\winrar.exe" (goto check7z1) else if not exist "%commander_path%\tools\winrar\default.sfx" (goto check7z1) else goto success2

:check7z1
if not exist "%programfiles%\7-zip\7zg.exe" (goto check7z2) else if not exist "%programfiles%\7-zip\7z.sfx" (goto check7z2) else if not exist "%programfiles%\7-zip\7z.dll" (goto check7z2) else goto success3

:check7z2
if not exist "%commander_path%\tools\7-zip\7zg.exe" (goto failure) else if not exist "%commander_path%\tools\7-zip\7z.sfx" (goto failure) else if not exist "%commander_path%\tools\7-zip\7z.dll" (goto failure) else goto success4

:success1
set path=%programfiles%\winrar
goto successrar

:success2
set path=%commander_path%\tools\winrar
goto successrar

:success3
set path=%programfiles%\7-zip
goto success7z

:success4
set path=%commander_path%\tools\7-zip
goto success7z

:successrar
del ..\user\*.br2 >nul 2>nul
winrar.exe a -k -ibck -iicon"batch\backup\icon.ico" -sfx -z"batch\backup\comment.txt" "TC.常用设置备份.rar" ..\wcx_ftp.ini ..\user
nircmd infobox "请将备份文件移至安全位置.~n~n位置:~t~$folder.desktop$~n文件名:~tTC.常用设置备份.exe~n说明:~tWinRAR 自解压包" "备份成功"
nircmd execmd move /Y TC.常用设置备份.exe "~$folder.desktop$"
exit

:success7z
del ..\user\*.br2 >nul 2>nul
7zg.exe a  -sfx7z.sfx "TC.常用设置备份.exe" ..\wcx_ftp.ini ..\user
nircmd infobox "请将备份文件移至安全位置.~n~n位置:~t~$folder.desktop$~n文件名:~tTC.常用设置备份.exe~n说明:~t7Zip 自解压包" "备份成功"
nircmd execmd move /Y TC.常用设置备份.exe "~$folder.desktop$"
exit

:failure
cd "%commander_path%\tools"
nircmd infobox "备份常用设置需要 7Zip 或 WinRAR.~n~n解决方法:~n1. 安装 7Zip 或 WinRAR~n~n2. 将以下文件放到:~n%COMMANDER_PATH%\TOOLS\7-Zip~n或~n%COMMANDER_PATH%\TOOLS\WinRAR~n~n所需文件:~n7Zip~t- 7z.DLL, 7zG.EXE 和 7z.SFX~nWinRAR~t- Default.SFX 和 WinRAR.EXE" "备份失败"
exit