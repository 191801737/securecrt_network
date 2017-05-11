# $language = "JScript"
# $interface = "1.0"

// configuration for H3C S1626V100R012
//author wl30564
//version 1.0
//Strongly recommended to use the latest version of SecureCRT

var ForReading = 1, ForWriting = 2;
var objTab= crt.GetScriptTab();

function main() 
{
	var fso, f,f2,tex;
	fso = new ActiveXObject("Scripting.FileSystemObject");		 
	f = fso.OpenTextFile("d:\\bak\\sw1626.txt", 1);
	crt.Screen.Synchronous = true;
	while ( f.AtEndOfStream != true ) 
	{  	
		var str,t;
		str=f.Readline();
		params=str.split(" ");
		objTab.Session.Connect("/telnet " + params[0]);
		objTab.Screen.WaitForString( "Password:");
		objTab.Screen.Send(params[1] + "\r");
		objTab.Screen.WaitForString( "ENTER");
		objTab.Screen.Send ("\r");
		objTab.Screen.WaitForString( ">");
		objTab.Screen.Send ("sys\r");	
		objTab.Screen.WaitForString("]");
		objTab.Screen.Send ("info-center enable\r");
		objTab.Screen.WaitForString("]");
		objTab.Screen.Send ("info-center loghost ip 10.10.10.10\r");
		objTab.Screen.WaitForString("]");
		objTab.Screen.Send ("save\r");
		objTab.Screen.WaitForString("]");
		objTab.Screen.Send ("y\r");
		objTab.Screen.WaitForString("]");
		objTab.Session.Disconnect();
	}	
	crt.Screen.Synchronous = false;
}
