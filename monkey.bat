:: 设置包名
set packageName=com.quick.gamebooster
:: 事件之间的时间间隔，默认为500ms
set eventTime=500
:: 事件个数
set eventCount=100

:: 根据日期时间设置monkey的log目录
set year=%date:~2,2%
set month=%date:~5,2%
set day=%date:~8,2%
set hour=%time:~0,2%
set minute=%time:~3,2%
set logDir=monkey_%year%%month%%day%_%hour%%minute%
set logFile=monkey_%year%%month%%day%_%hour%%minute%.txt

:: 开始执行monkey命令
set cmd="monkey -p %packageName% --pct-touch 40 --pct-motion 10 --pct-appswitch 40 --pct-anyevent 10 --throttle %eventTime% --ignore-crashes --ignore-timeouts --ignore-security-exceptions -v %eventCount%"
echo %cmd%
adb shell %cmd% > %logFile%

:: 如果/sdcard目录下有crash文件，将文件保存到logDir, pull到本地后，删除/sdcard/logDir
rem adb shell "cd /sdcard  && mkdir %logDir% && mv app_crash* %logDir%"
rem adb pull /sdcard/%logDir% %logDir%
rem adb shell "cd /sdcard && rm -rf %logDir%"

rem :: 提示是存在崩溃
rem echo "Finish Monkey Test!"
rem @if exist %logDir% (
rem 	echo "There are crashes!"
rem ) else (
rem 	echo "No crashes!"
rem ) 

pause
