#!/bin/bash
vagrant winrm --command "reg add \"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\" /v fDenyTSConnections /t REG_DWORD /d 0 /f"
vagrant winrm --command "netsh advfirewall firewall set rule group=\" remote desktop\" new enable=yes"
vagrant winrm --command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name \"fDenyTSConnections\" -Value 0"
vagrant winrm --command "Enable-NetFirewallRule -DisplayGroup \"Remote Desktop\""
vagrant winrm --command "ipconfig"