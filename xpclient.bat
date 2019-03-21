@echo off

netsh firewall reset

netsh firewall set opmode mode=ENABLE exceptions=ENABLE profile=ALL

netsh firewall set icmpsetting 8 enable

pause
