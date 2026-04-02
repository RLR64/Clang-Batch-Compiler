@echo off

echo Creating C project structure...
echo.

:: Create folder structure
mkdir src
mkdir include
mkdir debug
mkdir release

echo Folder structure created.
echo.

:: Generate CMakeLists.txt
(
echo cmake_minimum_required^(VERSION 4.3^)
echo.
echo # Project Name and Lanuage
echo project^(hello_world C^)
echo.
echo # Set C Standard
echo set^(CMAKE_C_STANDARD 23^)
echo set^(CMAKE_C_STANDARD_REQUIRED ON^)
echo set^(CMAKE_C_EXTENSIONS OFF^)
echo.
echo # Generate compile_commands.json for ClangD
echo set^(CMAKE_EXPORT_COMPILE_COMMANDS ON^)
echo.
echo # Enable warnings and debugging symbols
echo add_compile_options^(-Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow -g -O0^)
echo.
echo # Include headers from include/
echo include_directories^(include^)
echo.
echo # Compile executable
echo add_executable^(hello_world
echo     src/main.c
echo ^)
) > CMakeLists.txt

echo CMakeLists.txt generated.
echo.

:: Generate CMakePresets.json
(
echo {
echo     "version" : 8,
echo     "cmakeMinimumRequired": {
echo         "major" : 4,
echo         "minor" : 3,
echo         "patch" : 0
echo     },
echo     "configurePresets" : [
echo         {
echo             "name" : "debug",
echo             "displayName" : "debug",
echo             "description" : "Debug Build using Clang and Ninja",
echo             "generator" : "Ninja",
echo             "binaryDir" : "${sourceDir}/debug",
echo             "cacheVariables" : {
echo                 "CMAKE_C_COMPILER" : "clang",
echo                 "CMAKE_BUILD_TYPE" : "Debug",
echo                 "CMAKE_EXPORT_COMPILE_COMMANDS" : true
echo             }
echo         },
echo         {
echo             "name" : "release",
echo             "displayName" : "release",
echo             "description" : "Release Build using Clang and Ninja",
echo             "generator" : "Ninja",
echo             "binaryDir" : "${sourceDir}/release",
echo             "cacheVariables" : {
echo                 "CMAKE_C_COMPILER" : "clang",
echo                 "CMAKE_BUILD_TYPE" : "Release",
echo                 "CMAKE_EXPORT_COMPILE_COMMANDS" : true
echo             }
echo         }
echo     ],
echo     "buildPresets" : [
echo         {
echo             "name" : "debug",
echo             "configurePreset" : "debug"
echo         },
echo         {
echo             "name" : "release",
echo             "configurePreset" : "release"
echo         }
echo    ]
echo }
) > CMakePresets.json

echo CMakePresets.json generated.
echo.

:: Generate main.c
(
echo #include ^<stdio.h^>
echo.
echo int main^(^) {
echo 	printf^("C23 Hello World!"^);
echo 	return 0;
echo }
) > src/main.c

echo main.c generated.
echo.
echo Project created successfully!
echo.
echo To build and run:
echo   Debug build:
echo     cmake --preset debug
echo     cmake --build debug/
echo     debug/hello_world
echo.
echo   Release build:
echo     cmake --preset release
echo     cmake --build release/
echo     release/hello_world
echo.