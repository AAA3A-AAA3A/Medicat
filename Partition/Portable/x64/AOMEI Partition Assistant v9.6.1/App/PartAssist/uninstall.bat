@echo off
if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="X86" goto SYS32

SetupGreen64.exe -u
LoadDrv_x64.exe -u
goto FINISH

:SYS32
SetupGreen32.exe -u
LoadDrv_Win32.exe -u

:FINISH