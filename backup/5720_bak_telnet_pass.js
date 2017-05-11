# $language = "JScript"
# $interface = "1.0"

var ForReading = 1, ForWriting = 2;
var objTab= crt.GetScriptTab();


function main() 
{
	var fso, f,f2,tex;
	fso = new ActiveXObject("Scripting.FileSystemObject");		 
	f = fso.OpenTextFile("d:\\backup\\swip.txt", 1);
	//读取交换机ip文件D:\\backup\\swip.txt
	//var tex=f2.ReadALL();
	crt.Screen.Synchronous = true;
	while ( f.AtEndOfStream != true ) 
	{  	var str,t;
		str=f.Readline();
		params=str.split(" ");
//依次登录后 dis du
		objTab.Session.Connect("/telnet " + params[0]);				
		objTab.Screen.WaitForString( "Password:");
		objTab.Screen.Send(params[1] + "\r");
		objTab.Screen.WaitForString( ">");
		//objTab.Screen.Send ("sys" + "\r");
		
		objTab.Screen.WaitForString("]");
		//记录日志，即备份
	 objTab.Session.LogFileName = "D:\\backup\\Access_Backup\\"+params[0]+" .log";
		
	 objTab.Session.Log(true);
	 
	 objTab.Screen.Send("dis cu\r");
	 	//这里是发送空格哦 不然dis cu 显示不全 需要翻页。
		objTab.Screen.Send("                                      ");
		objTab.Screen.Send("                                      ");
		
		
		

		//objTab.Screen.WaitForString("@",15)
		objTab.Screen.WaitForString("]");		
		//objTab.Session.Log(false);
		objTab.Screen.Send("quit\r");
		//objTab.Screen.WaitForString("]");	
		objTab.Session.Log(false);
		//objTab.Screen.Send("quit\r");
		//objTab.Screen.WaitForString(">");
		//objTab.Screen.Send("save\r");
		//objTab.Screen.Send("y\r");
		objTab.Screen.WaitForString("@",2)
		objTab.Session.Disconnect();
		
		
		
		
	}	
	
}
