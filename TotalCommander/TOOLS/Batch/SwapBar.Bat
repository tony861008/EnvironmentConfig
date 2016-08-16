cd %commander_path%\user
..\addons\tcmc cmcm_VisButtonbar
rename default.bar tools.ini
rename tools.bar default.ini
del *.br2
..\tools\nircmd inisetval "..\user\tools.ini" "Buttonbar" "cmd1" "%%COMMANDER_PATH%%\USER\DEFAULT.BAR"
..\tools\nircmd inisetval "..\user\tools.ini" "Buttonbar" "button1" "WCICONEX.DLL,14"
..\tools\nircmd inisetval "..\user\default.ini" "Buttonbar" "cmd1" "%%COMMANDER_PATH%%\USER\TOOLS.BAR"
..\tools\nircmd inisetval "..\user\default.ini" "Buttonbar" "button1" "WCICONEX.DLL,77"
rename default.ini DEFAULT.BAR
rename tools.ini TOOLS.BAR
..\addons\tcmc cmopenbar ..\user\default.bar
..\addons\tcmc cmcm_VisButtonbar
exit