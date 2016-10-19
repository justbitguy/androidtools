::adb shell killall com.android.commands.monkey
adb shell "pgrep monkey | xargs kill -9"