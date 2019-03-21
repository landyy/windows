netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall firewall add rule name=ping action=allow protocol=icmpv4:8,any dir=in
netsh advfirewall firewall add rule name=ping action=allow protocol=icmpv4:8,any dir=out
