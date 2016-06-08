set packageName=com.quick.gamebooster
set dbName=info
set dbOutputName=info.out

adb shell "run-as %packageName% cp /data/data/%packageName%/databases/%dbName%" /sdcard/%dbOutputName%
adb pull /sdcard/%dbOutputName%

pause