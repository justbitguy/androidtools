set packageName=com.quick.gamebooster

set year=%date:~2,2%
set month=%date:~5,2%
set day=%date:~8,2%
set hour=%time:~0,2%
set minute=%time:~3,2%
set seconds=%time:~6,2%

echo day:%day%
echo hour:%hour%
set outDir=gb_%year%%month%%day%_%hour%%minute%
echo %outDir%

adb shell mkdir /sdcard/%outDir%
adb shell "run-as %packageName% cp -r /data/data/%packageName%" /sdcard/%outDir%
adb pull /sdcard/%outDir%  %outDir%
adb shell rm -rf /sdcard/%outDir%

pause