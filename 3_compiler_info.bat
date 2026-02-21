@echo off

echo Displaying Clang compiler information...
echo.

:: Check if clang is available
clang --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Clang not found in PATH
    echo Please ensure LLVM/Clang is properly installed.
    pause
    exit /b 1
)

:: Version Information
echo CLANG VERSION:
clang --version
echo.
echo CLANG++ VERSION:
clang++ --version
echo.

:: Target Architectures
echo AVAILABLE TARGETS:
clang --print-targets
echo.

:: Supported Standards
echo SUPPORTED STANDARDS:
echo C Standards:   C89, C95, C99, C11, C17, C23
echo Usage Example:         clang -std=c23 file.c
echo.
echo C++ Standards: C++98, C++03, C++11, C++14, C++17, C++20, C++23, C++26
echo Usage Example:         clang++ -std=c++26 file.cpp
echo.

:: Installation Paths
echo INSTALLATION PATHS:
where clang
where clang++
echo.

:: Additional LLVM Tools
echo LLVM TOOLS:

clang-tidy --version >nul 2>&1
if %errorlevel% equ 0 (echo clang-tidy:   Available) else (echo clang-tidy:   Not found)

clang-format --version >nul 2>&1
if %errorlevel% equ 0 (echo clang-format: Available) else (echo clang-format: Not found)

llvm-config --version >nul 2>&1
if %errorlevel% equ 0 (echo llvm-config:  Available) else (echo llvm-config:  Not found)

lld --version >nul 2>&1
if %errorlevel% equ 0 (echo lld:          Available) else (echo lld:          Not found)
echo.

:: C and C++ Support
echo REFERENCES:
echo C/C++ Documentation: https://en.cppreference.com/w/
echo Clang Support Status: https://cppstat.org/?tags=cpp,c,clang
echo.