@echo off

netsh firewall reset

netsh firewall set opmode mode=ENABLE exceptions=ENABLE profile=ALL

netsh firewall add portopening protocol=ALL port=53 "DNS For Domain" mode=ENABLE profile=ALL

netsh firewall add portopening protocol=ALL port=389 "LDAP" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=TCP port=686 "LDAP SSL" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=TCP port=3268 "LDAP SSL" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=TCP port=3269 "LDAP SSL" mode=ENABLE profile=ALL

netsh firewall add portopening protocol=ALL port=464 "Kerberos" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=ALL port=88 "Kerberos" mode=ENABLE profile=ALL

netsh firewall add portopening protocol=TCP port=3268 "LDAP GC" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=TCP port=139 "Netbios and co" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=UDP port=138 "Netbios and co" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=UDP port=137 "Netbios and co" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=ALL port=135 "RPC" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=ALL port=5722 "RPC" mode=ENABLE profile=ALL
netsh firewall add portopening protocol=TCP port=445 "SMB" mode=ENABLE profile=ALL

pause
