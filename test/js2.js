# $language = "JScript"
# $interface = "1.0"
crt.screen.Synchronous = true;
def main():
crt.screen.Send("\r\n");
crt.screen.ReadString("#");
crt.screen.Send("\r\n");
crt.screen.WaitForString("#");
crt.screen.Send("\r\n");
crt.screen.WaitForStrings("#",">");

main()
