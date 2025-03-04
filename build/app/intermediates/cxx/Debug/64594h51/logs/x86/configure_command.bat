@echo off
"C:\\Users\\rosto\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\src\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\groovy" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=x86" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86" ^
  "-DANDROID_NDK=C:\\Users\\rosto\\AppData\\Local\\Android\\sdk\\ndk\\27.2.12479018" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\rosto\\AppData\\Local\\Android\\sdk\\ndk\\27.2.12479018" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\rosto\\AppData\\Local\\Android\\sdk\\ndk\\27.2.12479018\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\rosto\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\Flutter Apps\\food_delivery_app\\build\\app\\intermediates\\cxx\\Debug\\64594h51\\obj\\x86" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\Flutter Apps\\food_delivery_app\\build\\app\\intermediates\\cxx\\Debug\\64594h51\\obj\\x86" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BD:\\Flutter Apps\\food_delivery_app\\android\\app\\.cxx\\Debug\\64594h51\\x86" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli
