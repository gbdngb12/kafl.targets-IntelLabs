#!/bin/bash

# 드라이버 이름 확인
driver="$1"
if [ -z "$driver" ]; then
    echo "사용법: $0 <드라이버 이름>"
    exit 1
fi

# 드라이버 검증 설정
echo "Setting up verifier for driver: $driver"
vagrant winrm --command "verifier /standard /driver $driver"

# 시스템 재부팅
echo "Rebooting system..."
vagrant winrm --command "shutdown -r -t 0"
echo "Reboot command issued. Please wait for the VM to restart."