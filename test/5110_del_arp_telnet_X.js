# $language = "JScript"
# $interface = "1.0"
var ForReading = 1, ForWriting = 2;
var objTab= crt.GetScriptTab();



function main() 
{
	var fso, f,f2,tex;
	fso = new ActiveXObject("Scripting.FileSystemObject");		 
	f = fso.OpenTextFile("d:\\bak\\sw5110.txt", 1);
	crt.Screen.Synchronous = true;
	while ( f.AtEndOfStream != true ) 
	{  	
		var str,t;
		str=f.Readline();
		params=str.split(" ");
		objTab.Session.Connect("/telnet " + params[0]);				
		objTab.Screen.WaitForString( "Password:");
		objTab.Screen.Send(params[1] + "\r");
		objTab.Screen.WaitForString( ">");
objTab.screen.Synchronous = true;
objTab.screen.Send("\r\n");
objTab.screen.ReadString("]");
objTab.screen.Send("\r\n");
objTab.screen.WaitForString("]");
objTab.screen.Send("\r\n");
objTab.screen.WaitForStrings("]",">");

		//objTab.Screen.Send("undo arp rate-limit\r");
		//objTab.Screen.Send("return\r");
		//objTab.Screen.WaitForString(">");
		//objTab.Screen.Send("save\r");
		//objTab.Screen.Send("y\r");
		//objTab.Screen.Send("\r"); 			
		//objTab.Screen.Send("y\r");
		//objTab.Screen.WaitForString("@",2)
		//crt.Screen.Synchronous = false;
		//objTab.Session.Disconnect();

	}	
	
}
