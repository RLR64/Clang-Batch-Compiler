@echo off
setlocal enabledelayedexpansion

echo Compiling C/C++ files with AddressSanitizer...
echo.

set compiled_count=0
set failed_count=0

:: Compile all .c files
for %%F in (*.c) do (
    echo Compiling %%F...
    clang -std=c23 -Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow -fsanitize=address,undefined -g -O0 "%%F" -o "%%~nF.exe"
    
    if !errorlevel! equ 0 (
        set /a compiled_count+=1
    ) else (
        echo [ERROR] Failed to compile: %%F
        set /a failed_count+=1
    )
    echo.
)

:: Compile all .cpp files
for %%F in (*.cpp) do (
    echo Compiling %%F...
    clang++ -std=c++26 -Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow -fsanitize=address,undefined -g -O0 "%%F" -o "%%~nF.exe"
    
    if !errorlevel! equ 0 (
        set /a compiled_count+=1
    ) else (
        echo [ERROR] Failed to compile: %%F
        set /a failed_count+=1
    )
    echo.
)

if %compiled_count%==0 if %failed_count%==0 (
    echo No C or C++ files found.
) else (
    echo Compiled: %compiled_count% ^| Failed: %failed_count%
)

echo Finished Compiling with AddressSanitizer
echo.