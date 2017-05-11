#$language = "VBScript"
#$interface = "1.0"
'backup configuration for WS-C2960X-24TS-L
'author wl30564
'version 1.0
'Strongly recommended to use the latest version of SecureCRT

Sub Main
    Const ForReading = 1, ForWriting = 2
    Dim fso,file,str,params
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("d:\bak\cisco.txt",Forreading, False)   
	crt.Screen.Synchronous = True
    DO While file.AtEndOfStream <> True
       str = file.ReadLine
       params = Split (str)
       cmd = "/SSH2 /L " & params(1) & " /PASSWORD " & params(2) & " /C 3DES /M MD5 " & params(0)
	   crt.Session.Connect cmd
	   
		crt.Screen.WaitForString ">"
		crt.Screen.Send "en" & chr(13)
		crt.Screen.WaitForString "Password"
		crt.Screen.Send params(3) & chr(13)
		crt.Screen.WaitForString "#"
		crt.Screen.Send "copy running-config tftp://10.1.40.43/"& params(0) &".txt" &chr(13)
		crt.Screen.WaitForString "?"
		crt.Screen.Send chr(13)
		crt.Screen.WaitForString "?"
		crt.Screen.Send chr(13)
		crt.Screen.WaitForString "#"
		crt.Session.disConnect
    Loop
	crt.Screen.Synchronous = False
End Sub
