@echo off
pushd "%~dp0"
ver|findstr "5.0" >NUL&&GOTO goto :WinXP32 || goto :OTHER
:OTHER
ver|findstr "5.1" >NUL&&GOTO :WinXP || goto :OTHER2
:WinXP
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" goto :WinXP32 else goto :Win200364
:WinXP32
xcopy /Y native\w2k\x86\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\w2k\x86\fre\ampa.sys %SYSTEMROOT%\system32\
goto :END

:OTHER2
ver|findstr "5.2" >NUL&&GOTO :Win2003 || goto :OTHER3
:Win2003
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" goto :Win200332 else goto :Win200364
:Win200364
xcopy /Y native\wnet\amd64\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wnet\amd64\fre\ampa.sys %SYSTEMROOT%\system32\
xcopy /Y native\wnet\amd64\fre\ampa.sys %SYSTEMROOT%\SysWOW64\
goto :END

:Win200332
xcopy /Y native\w2k\x86\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\w2k\x86\fre\ampa.sys %SYSTEMROOT%\system32\
goto :END

:OTHER3
ver|findstr "6.0" >NUL&&GOTO :Vista || goto :OTHER4
:Vista
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" goto :Vista32 else goto :Vista64
:Vista64
xcopy /Y native\wlh\amd64\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\system32\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\SysWOW64\
goto :END

:Vista32
xcopy /Y native\wlh\x86\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\x86\fre\ampa.sys %SYSTEMROOT%\system32\
goto :END

:OTHER4
ver|findstr "6.1" >NUL&&GOTO :Win7 || goto :OTHER5
:Win7
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" goto :Win732 else goto :Win764
:Win764
xcopy /Y native\wlh\amd64\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\system32\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\SysWOW64\
goto :END

:Win732
xcopy /Y native\wlh\x86\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\x86\fre\ampa.sys %SYSTEMROOT%\system32\
goto :END

:OTHER5
ver|findstr "10.0" >NUL&&GOTO :Win10 || goto :END
:Win10
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" goto :Win1032 else goto :Win1064
:Win1064
xcopy /Y native\wlh\amd64\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\system32\
xcopy /Y native\wlh\amd64\fre\ampa.sys %SYSTEMROOT%\SysWOW64\
goto :END

:Win1032
xcopy /Y native\wlh\x86\fre\ampa.exe %SYSTEMROOT%\
xcopy /Y native\wlh\x86\fre\ampa.sys %SYSTEMROOT%\system32\
goto :END

:END
