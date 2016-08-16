cd %commander_path%\tools
nircmd wait 200
set d=%date:/=%
set d=%d:-=%
set d=%d:~0,8%
if "%time:~0,1%"==" " (set t=0%time:~1,1%%time:~3,2%%time:~6,2%) else (set t=%time:~0,2%%time:~3,2%%time:~6,2%)
nircmd savescreenshot "~$folder.desktop$\½ØÆÁ.%d%-%t%.png"
nircmd stdbeep
exit