all:
	ndk-build -B NDK_DEBUG=1 NDK_PROJECT_PATH=. APP_PLATFORM=android-21 APP_BUILD_SCRIPT=./Android.mk

install32:
	adb push libs/armeabi/shim /data/local/tmp/

install:
	adb push libs/arm64-v8a/shim /data/local/tmp/

clean:
	ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk clean