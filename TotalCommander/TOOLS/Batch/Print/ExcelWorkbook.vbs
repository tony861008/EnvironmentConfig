Dim objxls
On error resume next
Set objxls = wscript.getobject("Excel.Application")
If objxls = "" then 
	set objxls = wscript.createobject("Excel.Application")
end if

if wscript.arguments.count = 0 then 
	msgbox("There are not enough arguments.")
	wscript.quit
end if

objxls.workbooks.open wscript.arguments(0),false
if objxls.workbooks.count = 0 then 
	Wscript.quit
Else
	objxls.workbooks(1).printout
	objxls.workbooks(1).Close False
	objxls.quit
End if

wscript.quit