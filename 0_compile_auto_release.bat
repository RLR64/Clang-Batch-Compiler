@echo off
setlocal enabledelayedexpansion
echo Auto-detecting and compiling C/C++ files...
echo.

set compiled_count=0
set failed_count=0

:: Compile all .c files
for %%F in (*.c) do (
    echo Found C file: %%F
    set filename=%%~nF
    echo Compiling %%F for release...
    clang -std=c23 -Wall -Wextra -Werror -O2 "%%F" -o "%%~nF.exe"
    
    if !errorlevel! equ 0 (
        echo Successfully compiled: %%~nF.exe
        set /a compiled_count+=1
    ) else (
        echo Failed to compile: %%F
        set /a failed_count+=1
    )
    echo.
)

:: Compile all .cpp files  
for %%F in (*.cpp) do (
    echo Found C++ file: %%F
    set filename=%%~nF
    echo Compiling %%F for release...
    clang++ -std=c++23 -Wall -Wextra -Werror -O2 "%%F" -o "%%~nF.exe"
    
    if !errorlevel! equ 0 (
        echo Successfully compiled: %%~nF.exe
        set /a compiled_count+=1
    ) else (
        echo Failed to compile: %%F
        set /a failed_count+=1
    )
    echo.
)

:: Summary
echo ==========================================
if %compiled_count%==0 if %failed_count%==0 (
    echo No C or C++ files found in current directory.
) else (
    echo Compilation Summary:
    echo Successfully compiled: %compiled_count% file(s)
    echo Failed compilations: %failed_count% file(s)
)
echo ==========================================