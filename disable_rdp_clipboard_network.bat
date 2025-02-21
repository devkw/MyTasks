@echo off
:: 실행 흔적 숨김
start /b cmd /c "reg add \"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\" /v fDisableClip /t REG_DWORD /d 1 /f >nul 2>&1"
start /b cmd /c "reg add \"HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\" /v fDisableCdm /t REG_DWORD /d 1 /f >nul 2>&1"

:: 그룹 정책 즉시 적용 (출력 숨김)
start /b cmd /c "gpupdate /force >nul 2>&1"

:: 원격 데스크톱 서비스(RDP)가 변경 사항을 반영하도록 설정 적용
start /b cmd /c "sc config UmRdpService start= auto >nul 2>&1"
start /b cmd /c "sc stop UmRdpService >nul 2>&1"
start /b cmd /c "sc start UmRdpService >nul 2>&1"

:: 빠른 종료
exit