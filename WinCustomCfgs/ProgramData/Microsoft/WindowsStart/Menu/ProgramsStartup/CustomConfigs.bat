Bcdedit.exe -set TESTSIGNING OFF 
Net stop wuauserv 
sc config "wuauserv" start=disabled 