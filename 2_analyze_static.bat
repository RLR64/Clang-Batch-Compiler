@echo off
setlocal enabledelayedexpansion
echo Running static analysis on C/C++ files...
echo.

:: Check if clang-tidy is available
clang-tidy --version >nul 2>&1
if !errorlevel! neq 0 (
    echo ERROR: clang-tidy not found in PATH
    echo Please ensure LLVM/Clang tools are properly installed and in your PATH
    echo.
    pause
    exit /b 1
)

set analyzed_count=0
set issues_found=0

echo Using clang-tidy for static analysis...
echo.

:: Analyze all .c files
for %%F in (*.c) do (
    echo Analyzing C file: %%F
    echo ----------------------------------------
    clang-tidy "%%F" -- -std=c23
    
    if !errorlevel! equ 0 (
        echo No issues found in: %%F
    ) else (
        echo Issues detected in: %%F
        set /a issues_found+=1
    )
    set /a analyzed_count+=1
    echo.
)

:: Analyze all .cpp files
for %%F in (*.cpp) do (
    echo Analyzing C++ file: %%F
    echo ----------------------------------------
    clang-tidy "%%F" -- -std=c++23
    
    if !errorlevel! equ 0 (
        echo No issues found in: %%F
    ) else (
        echo Issues detected in: %%F
        set /a issues_found+=1
    )
    set /a analyzed_count+=1
    echo.
)

:: Summary
echo ==========================================
if %analyzed_count%==0 (
    echo No C or C++ files found in current directory.
) else (
    echo Static Analysis Summary:
    echo Files analyzed: %analyzed_count%
    echo Files with potential issues: %issues_found%
    echo.
    if %issues_found%==0 (
        echo Great! No static analysis issues detected.
    ) else (
        echo Review the issues above and consider fixing them.
        echo Use 'clang-tidy --fix filename.c' to auto-fix some issues.
    )
)
echo ==========================================