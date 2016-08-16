cd %commander_path%\tools
if exist "%programfiles%\Foxit Software\Foxit Reader\Foxit Reader.exe" (goto foxprint) else goto adobeprint
:foxprint
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "Path" "%programfiles%\Foxit Software\Foxit Reader\Foxit Reader.exe"
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "Params" "/p ~x25L~x25"
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "MaxFiles" "1"
..\addons\tcmc emem_batchprintpdf
exit
:adobeprint
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "Path" "%COMMANDER_PATH%\TOOLS\NirCMD.EXE"
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "Params" "exec hide PDFP ~x25L~x25"
nircmd inisetval ..\addons\totaleditor\batchprintpdf.ini "PDF" "MaxFiles" "9999"
..\addons\tcmc emem_batchprintpdf
exit