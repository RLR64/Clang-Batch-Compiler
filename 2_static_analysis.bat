@echo off
setlocal enabledelayedexpansion

echo Running static analysis on C/C++ files...
echo.

:: Check if clang-tidy is available
clang-tidy --version >nul 2>&1
if !errorlevel! neq 0 (
    echo [ERROR] clang-tidy not found in PATH
    echo Please ensure LLVM/Clang tools are properly installed.
    pause
    exit /b 1
)

set analyzed_count=0
set issues_found=0

:: Analyze all .c files
for %%F in (*.c) do (
    echo Analyzing %%F...
    clang-tidy "%%F" -- -std=c23
    
    if !errorlevel! neq 0 set /a issues_found+=1
    set /a analyzed_count+=1
    echo.
)

:: Analyze all .cpp files
for %%F in (*.cpp) do (
    echo Analyzing %%F...
    clang-tidy "%%F" -- -std=c++26
    
    if !errorlevel! neq 0 set /a issues_found+=1
    set /a analyzed_count+=1
    echo.
)

:: Summary
if %analyzed_count%==0 (
    echo No C or C++ files found.
) else (
    echo Analyzed: %analyzed_count% ^| Issues: %issues_found%
    echo.
    if %issues_found%==0 (
        echo No static analysis issues detected.
    ) else (
        echo Use 'clang-tidy --fix filename' to auto-fix some issues.
    )
)

echo.
echo Static Analysis Finished
echo.