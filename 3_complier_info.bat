@echo off
echo Displaying Clang compiler information...
echo.

:: Check if clang is available
clang --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: clang not found in PATH
    echo Please ensure LLVM/Clang is properly installed and in your PATH
    echo.
    pause
    exit /b 1
)

echo ==========================================
echo CLANG VERSION INFORMATION
echo ==========================================
clang --version
echo.

echo ==========================================
echo CLANG++ VERSION INFORMATION  
echo ==========================================
clang++ --version
echo.

echo ==========================================
echo AVAILABLE TARGET ARCHITECTURES
echo ==========================================
echo Clang targets:
clang --print-targets
echo.

echo ==========================================
echo SUPPORTED C STANDARDS
echo ==========================================
echo C Standards: c89, c90, c99, c11, c17, c18, c2x, c23
echo Use with: clang -std=c23 file.c
echo.

echo ==========================================
echo SUPPORTED C++ STANDARDS
echo ==========================================
echo C++ Standards: c++98, c++03, c++11, c++14, c++17, c++20, c++2b, c++23
echo Use with: clang++ -std=c++23 file.cpp
echo.

echo ==========================================
echo CLANG INSTALLATION PATHS
echo ==========================================
echo Clang executable path:
where clang
echo.
echo Clang++ executable path:
where clang++
echo.

echo ==========================================
echo USEFUL CLANG TOOLS (if available)
echo ==========================================
echo Checking for additional LLVM tools...

clang-tidy --version >nul 2>&1
if %errorlevel% equ 0 (
    echo clang-tidy: Available for static analysis
) else (
    echo clang-tidy: Not available
)

clang-format --version >nul 2>&1  
if %errorlevel% equ 0 (
    echo clang-format: Available for code formatting
) else (
    echo clang-format: Not available
)

llvm-config --version >nul 2>&1
if %errorlevel% equ 0 (
    echo llvm-config: Available
) else (
    echo llvm-config: Not available
)

lld --version >nul 2>&1
if %errorlevel% equ 0 (
    echo lld: LLVM linker available
) else (
    echo lld: LLVM linker not available
)

echo.
echo ==========================================