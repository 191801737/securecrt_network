#$language = "VBScript"
#$interface = "1.0"

'author wl30564
'version 1.0

crt.Screen.Synchronous = True
'将结果显示在crt上面
Sub Main
    Const ForReading = 1, ForWriting = 2
	'ForReading 1 打开文件用于只读操作。不能对文件进行写操作。 
	'ForWriting 2 打开文件用于写操作。如果存在具有相同文件名的文件，文件原有的内容被覆盖.
    Dim fso,file,str,params
	'Dim定义的变量为自动变量
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("d:\bak\sw5110.txt",Forreading, False)   
    crt.Screen.Synchronous = True'这行去掉会这么样？
    DO While file.AtEndOfStream <> True
	''循环读取文档的每一行  
		str = file.ReadLine '读取文件中的每一行
		params = Split (str) ' 定义参数 把 str 分离定义
		cmd = "/SSH2 /L " & params(1) & " /PASSWORD " & params(2) & " /C AES-128 /M MD5 " & params(0)
		'SSH 登陆，/C 是加密方式  /M 是哈希算法
		crt.Session.Connect cmd

        'crt.screen.Send Chr(13) '发送回车
	crt.Screen.WaitForString ">"
	'crt.Screen.Send "sys" & chr(13)
	'crt.Screen.WaitForString "Password:"
	'crt.Screen.Send "特权密码" & chr(13)
	'crt.Screen.WaitForString "#"
	crt.Screen.Send "tftp 10.1.40.43 put startup.cfg " & params(0) &".txt " &chr(13)
	'crt.Screen.WaitForString "#"
	'crt.Screen.Send "exit" & chr(13)
		crt.Session.disConnect 
		'断开当前SESSION的连接
    Loop
    crt.Screen.Synchronous= False
End Sub
