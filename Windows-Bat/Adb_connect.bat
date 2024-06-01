@echo off
set /p port=please input your phone port: 
call :adb %port%
echo Success your phone!!!
pause
:adb
adb connect 192.168.31.180:%1
goto :eof