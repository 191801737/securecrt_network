#$language = "VBScript"
#$interface = "1.0"
'backup configuration of h3c 5110
'author wl30564
'version 1.3

Sub Main
    Const ForReading = 1, ForWriting = 2
    Dim fso,file,str,params
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("d:\bak\sw5110.txt",Forreading, False)     
	crt.Screen.Synchronous = True	
    DO While file.AtEndOfStream <> True
       str = file.ReadLine
       params = Split (str)
       cmd = "/SSH2 /L " & params(1) & " /PASSWORD " & params(2) & " /C AES-128 /M MD5 " & params(0)
	   crt.Session.Connect cmd
	   
'		crt.Screen.WaitForString ">"
'		crt.Screen.Send "sys" &chr(13)
'		crt.Screen.WaitForString "]"
'		crt.Screen.Send  "info-center logfile enable"&chr(13)
'		crt.Screen.WaitForString "]"
'		crt.Screen.Send "info-center enable " &chr(13)
'		crt.Screen.WaitForString "]"
'		crt.Screen.Send "info-center loghost 10.10.10.10" &chr(13)		
'		crt.Screen.WaitForString "]"
'		crt.Screen.Send "return" &chr(13)
		crt.Screen.WaitForString ">"
		crt.Screen.Send "save" &chr(13)
		crt.Screen.WaitForString ":"
		crt.Screen.Send "y" &chr(13)
		crt.Screen.WaitForString ":"
		crt.Screen.Send chr(13)
		crt.Screen.WaitForString ":"
		crt.Screen.Send "y" &chr(13)
		crt.Screen.WaitForString "Validating"
		crt.Session.disConnect
    Loop
		crt.Screen.Synchronous = False
End Sub
