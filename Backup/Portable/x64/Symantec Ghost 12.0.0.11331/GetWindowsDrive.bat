@echo off
for %%a in (C D E F G H I J K L M N O P Q R S T U V W Y Z) do if exist %%a:\Windows set WINDOWSDRIVE=%%a
echo { ActiveWndDrive = "%WINDOWSDRIVE%:", ActiveWndDir = "%WINDOWSDRIVE%:\\Windows" } > act_wnd.txt
echo Windows Drive found at %WINDOWSDRIVE%