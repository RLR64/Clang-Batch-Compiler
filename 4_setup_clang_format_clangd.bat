@echo off

echo Generating .clang-format configuration...
echo.

:: Create .clang-format file
(
echo BasedOnStyle: LLVM
echo UseTab: Always
echo TabWidth: 4
echo IndentWidth: 4
) > .clang-format

echo .clang-format created successfully.
echo.

echo Generating .clangd configuration...
echo.

:: Create .clangd file
(
echo CompileFlags:
echo   CompilationDatabase: debug
) > .clangd

echo .clangd created successfully.
echo.

:: Check if clang-format is available
clang-format --version > nul 2 >&1
if %errorlevel% neq 0 (
    echo [ERROR] clang-format not found in PATH
    echo Please ensure LLVM/Clang tools are properly installed.
    pause
    exit /b 1
)

:: Format all C files
echo Formatting C files...
for %%F in (*.c) do (
    echo Formatting %%F...
    clang-format -i "%%F"
)

:: Format all C header files
echo Formatting C header files...
for %%F in (*.h) do (
    echo Formatting %%F...
    clang-format -i "%%F"
)

:: Format all C++ files
echo Formatting C++ files...
for %%F in (*.cpp) do (
    echo Formatting %%F...
    clang-format -i "%%F"
)

:: Format all C++ header files
echo Formatting C++ header files...
for %%F in (*.hpp) do (
    echo Formatting %%F...
    clang-format -i "%%F"
)

echo.
echo Formatting complete!
echo.