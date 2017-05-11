#$language = "VBScript"
#$interface = "1.0"

'backup configuration of ruijie 2628
'author wl30564
'version 1.0

crt.Screen.Synchronous = True

Sub Main
    Const ForReading = 1, ForWriting = 2
    Dim fso,file,str,params
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("d:\bak\sw2628.txt",Forreading, False)        
    crt.Screen.Synchronous = True
    DO While file.AtEndOfStream <> True
       str = file.ReadLine
       params = Split (str)
       cmd = "/SSH2 /L " & params(1) & " /PASSWORD " & params(2) & " /C AES-128 /M MD5 " & params(0)
		crt.Session.Connect cmd

	crt.Screen.WaitForString "#"
	crt.Screen.Send "conf t" & chr(13)
	crt.Screen.WaitForString "#"
	crt.Screen.Send "logging on" & chr(13)
	crt.Screen.WaitForString "#"
	crt.Screen.Send "logging server 10.10.10.10" & chr(13)
	crt.Screen.WaitForString "#"
	crt.Screen.Send "end" & chr(13)
	crt.Screen.WaitForString "#"
	crt.Screen.Send "write" & chr(13)
	crt.Screen.WaitForString "[OK]"
	crt.Screen.WaitForString "#"
    crt.Session.disConnect
    Loop
    crt.Screen.Synchronous = False
End Sub
