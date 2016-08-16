Dim objdoc
On error resume next
Set objdoc = wscript.getobject("Word.Application")
If objdoc = "" then 
	set objdoc = wscript.createobject("Word.Application")
end if

if wscript.arguments.count = 0 then 
	msgbox("There are not enough arguments.")
	wscript.quit
end if

objdoc.documents.open wscript.arguments(0),false
if objdoc.documents.count = 0 then 
	Wscript.quit
Else
	objdoc.documents(1).printout
	objdoc.documents(1).Close False
	objdoc.quit
End if

wscript.quit