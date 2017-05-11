#$language = "VBScript"
#$interface = "1.0"
'backup configuration of huawei 5720
'author wl30564
'version 1.3

Sub Main
    Const ForReading = 1, ForWriting = 2
    Dim fso,file,str,params
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("d:\bak\SW5720.txt",Forreading, False)   
	crt.Screen.Synchronous = True
    DO While file.AtEndOfStream <> True
       str = file.ReadLine
       params = Split (str)
       cmd = "/SSH2 /L " & params(1) & " /PASSWORD " & params(2) & " /C AES-128 /M MD5 " & params(0)
	   crt.Session.Connect cmd
	   
		crt.Screen.WaitForString ">"
		crt.Screen.Send "tftp 10.6.105.129 put vrpcfg.zip " & params(0) &".zip" &chr(13)
		crt.Screen.WaitForString ">"
		crt.Session.disConnect
    Loop
	crt.Screen.Synchronous = False
End Sub
