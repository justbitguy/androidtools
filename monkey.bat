set cmd="monkey -p com.quick.gamebooster --pct-touch 40 --pct-motion 10 --pct-appswitch 40 --pct-anyevent 10 --throttle 1000 --bugreport -v 500"
echo %cmd%
adb shell %cmd% 

