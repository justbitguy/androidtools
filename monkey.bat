:: 设置包名
set packageName=com.quick.gamebooster
:: 事件之间的时间间隔，默认为500ms
set eventTime=500
:: 事件个数
set eventCount=100

:: 根据日期时间设置monkey的log目录
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%

set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%

set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%

set year=%date:~2, 2%

set month=%date:~5,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%

set day=%date:~8,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%

set logFile=monkey_%year%%month%%day%_%hour%%min%.txt
 
:: 开始执行monkey命令
set cmd="monkey -p %packageName% --pct-touch 40 --pct-motion 10 --pct-appswitch 40 --pct-anyevent 10 --throttle %eventTime% --ignore-crashes --ignore-timeouts --ignore-security-exceptions --script-log -v %eventCount%"
echo %cmd%
adb shell %cmd% > %logFile%

findstr "CRASH:" %logFile% > crash.txt
for /f %%i in ("crash.txt") do set size=%%~zi
@if %size% gtr 0 (
	echo There are crashes!
) else (
	echo There are no crashes!
)

pause
