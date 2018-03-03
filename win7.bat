@echo off

:: Thank you Jamie!! <3

:: Dc IP
SET ip=192.168.58.128

:: ESXI IP
:: SET esxi=192.168.0.1

:: Basic config things
netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name =all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

:: DNS
:: Once DNS is confirmed to work you should add the remoteip=%ip% option
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=tcp remoteport=53 enable=yes profile=any
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=udp remoteport=53 enable=yes profile=any
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=tcp remoteport=53 enable=yes profile=any
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=udp remoteport=53 enable=yes profile=any

:: AD/LDAP Client that is already joined to Domain
netsh advfirewall firewall add rule name=AdClient dir=out protocol=tcp remoteport=88,389,445 remoteip=%ip% action=allow
netsh advfirewall firewall add rule name=AdClinet dir=in protocol=tcp remoteport=88,389,445 remoteip=%ip% action=allow
netsh advfirewall firewall add rule name=ADclinet dir=in protocol=udp remoteport=389 remoteip=%ip% action=allow
netsh advfirewall firewall add rule name=ADclinet dir=out protocol=udp remoteport=389 remoteip=%ip% action=allow

:: Join a Domain
:: Pick one above or below depending on the situation :D
netsh advfirewall firewall add rule name=join dir=in remoteip=%ip% action=allow
netsh advfirewall firewall add rule name=join dir=out remoteip=%ip% action=allow

:: Web browser rule, replace with firefox eventually 
netsh advfirewall firewall add rule name="Allow Firefox" dir=in action=allow program="C:\Program Files\Mozilla Firefox\firefox.exe" enable=yes profile=any
netsh advfirewall firewall add rule name="Allow Firefox" dir=out action=allow program="C:\Program Files\Mozilla Firefox\firefox.exe" enable=yes profile=any

:: Syslog!
netsh advfirewall firewall add rule name=syslog dir=out protocol=udp remoteport=514 action=allow

:: Vsphere client
:: If we go through browser, browser rule should be gucci
netsh advfirewall firewall add rule name=vsphere dir=in protocol=tcp remoteport=443,902,903 remoteip=%ip% action=allow
netsh advfirewall firewall add rule name=vsphere dir=in protocol=tcp remoteport=443,902,903 remoteip=%ip% action=allow

:: RDP Client
netsh advfirewall firewall add rule name=RDP dir=out protocol=tcp remoteport=3389 action=allow
netsh advfirewall firewall add rule name=RDP dir=in protocol=tcp remoteport=3389 action=allow

pause

