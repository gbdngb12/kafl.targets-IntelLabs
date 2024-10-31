#!/bin/bash

# xfreerdp 설치 여부 확인
if ! command -v xfreerdp &> /dev/null; then
    echo "xfreerdp가 설치되어 있지 않습니다. 설치를 시작합니다..."
    sudo apt update
    sudo apt install -y freerdp2-x11
else
    echo "xfreerdp가 이미 설치되어 있습니다."
fi

# 기본 사용법을 제공하는 함수
usage() {
    echo "사용법: $0 <원격 주소> [해상도]"
    echo "예: $0 192.168.1.100 1920x1080"
    exit 1
}

# 인자 확인
if [ -z "$1" ]; then
    usage
fi

# 변수 설정
SERVER="$1"

# xfreerdp 명령어 실행
xfreerdp /u:vagrant /p:vagrant /v:"$SERVER" #+clipboard +fonts