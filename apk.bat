@echo apk tool:
@echo 	-i : adb install -r PACKAGE
@if "%1" == "-i" adb install -r %2 
