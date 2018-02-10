@echo off

SET ip=192.168.58.128

netsh advfirewall reset

netsh advfirewall firewall delete rule name =all

netsh advfirewall firewall add rule name="DNS" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=53 enable=yes profile=any
netsh advfirewall firewall add rule name="DNS" dir=out remoteip=%ip% action=allow protocol=udp remoteport=53 enable=yes profile=any

netsh advfirewall firewall add rule name="LDAP" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=389 enable=yes profile=any
netsh advfirewall firewall add rule name="LDAP UDP" dir=out remoteip=%ip% action=allow protocol=udp remoteport=389 enable=yes profile=any
netsh advfirewall firewall add rule name="LDAP SSL" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=686 enable=yes profile=any
netsh advfirewall firewall add rule name="LDAP GC" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=3268 enable=yes profile=any
netsh advfirewall firewall add rule name="LDAP GC" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=3269 enable=yes profile=any

netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=464 enable=yes profile=any
netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=udp remoteport=464 enable=yes profile=any
netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=88 enable=yes profile=any
netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=udp remoteport=88 enable=yes profile=any

netsh advfirewall firewall add rule name="Netbios" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=139 enable=yes profile=any
netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=udp remoteport=138 enable=yes profile=any
netsh advfirewall firewall add rule name="Kerberos" dir=out remoteip=%ip% action=allow protocol=udp remoteport=137 enable=yes profile=any

netsh advfirewall firewall add rule name="RPC" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=135 enable=yes profile=any
netsh advfirewall firewall add rule name="RPC" dir=out remoteip=%ip% action=allow protocol=udp remoteport=135 enable=yes profile=any
netsh advfirewall firewall add rule name="RPC" dir=out remoteip=%ip% action=allow protocol=udp remoteport=5722 enable=yes profile=any
netsh advfirewall firewall add rule name="RPC" dir=out remoteip=%ip% action=allow protocol=udp remoteport=5722 enable=yes profile=any

netsh advfirewall firewall add rule name="RPC" dir=out remoteip=%ip% action=allow protocol=tcp remoteport=455 enable=yes profile=any

netsh advfirewall firewall add rule name="Allow Firefox" dir=in action=allow program="C:\Program Files\Mozilla Firefox\firefox.exe" enable=yes profile=any

pause
