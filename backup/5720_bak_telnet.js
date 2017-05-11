# $language = "JScript"
# $interface = "1.0"
var ForReading = 1, ForWriting = 2;

var objTab= crt.GetScriptTab();
crt.Screen.Synchronous = true;

function main() 
{
	var fso, f,f2,tex;
	fso = new ActiveXObject("Scripting.FileSystemObject");		 
	f = fso.OpenTextFile("d:\\test\\allswip.txt", 1);	
	//var tex=f2.ReadALL();
	while ( f.AtEndOfStream != true ) 
	{ 
	var str,t;
		str=f.Readline();
		params=str.split(" ");
		try{
		objTab.Session.Connect("/telnet " + params[0]);				
		objTab.Screen.WaitForString("Username:");
		objTab.Screen.Send(params[1]+"\r");
		objTab.Screen.WaitForString( "Password:");
		objTab.Screen.Send(params[2] + "\r");
		objTab.Screen.WaitForString( ">");
		objTab.Screen.Send ("super 3" + "\r");
		objTab.Screen.WaitForString( " Password:");
	    objTab.Screen.Send (params[3] + "\r");
		objTab.Screen.WaitForString( ">");
		objTab.Screen.Send ("sys" + "\r");
		
		objTab.Screen.WaitForString("]");
		//objTab.Dialog.MessageBox(tex);
		objTab.Screen.Send(tex);
		//objTab.sleep(6000);
		
		//objTab.Screen.WaitForString("@",15)
		objTab.Screen.WaitForString("]");		
		objTab.Screen.Send("quit\r");
		
		objTab.Screen.WaitForString(">");
		objTab.Screen.Send("save\r");
				objTab.Screen.Send("y\r");
				objTab.Screen.WaitForString("@", 4)				
		}catch(err){continue; }
				objTab.Session.Disconnect();
		
		
		
		
	}	
	
}
