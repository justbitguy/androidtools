@if "%1" == "-i" adb install -r -d %2 
@if "%1" == "-r" adb uninstall %2