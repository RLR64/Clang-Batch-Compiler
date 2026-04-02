@echo off

echo Generating .clang-format configuration...
echo.

:: Delete existing file first to avoid appending to old content
if exist .clang-format del .clang-format

:: Create .clang-format file line by line using append redirection
echo BasedOnStyle: LLVM                                                 >> .clang-format
echo.                                                                   >> .clang-format
echo # Indentation - use tabs                                           >> .clang-format
echo IndentWidth: 4                                                     >> .clang-format
echo TabWidth: 4                                                        >> .clang-format
echo UseTab: ForIndentation                                             >> .clang-format
echo.                                                                   >> .clang-format
echo # Line length                                                      >> .clang-format
echo ColumnLimit: 120                                                   >> .clang-format
echo.                                                                   >> .clang-format
echo # Braces - Attach style keeps { on same line as class/function     >> .clang-format
echo BreakBeforeBraces: Attach                                          >> .clang-format
echo.                                                                   >> .clang-format
echo # Spaces                                                           >> .clang-format
echo SpaceBeforeParens: ControlStatements                               >> .clang-format
echo SpaceInEmptyParentheses: false                                     >> .clang-format
echo SpacesInAngles: false                                              >> .clang-format
echo SpacesInContainerLiterals: false                                   >> .clang-format
echo SpaceAfterCStyleCast: false                                        >> .clang-format
echo.                                                                   >> .clang-format
echo # Alignment                                                        >> .clang-format
echo AlignConsecutiveAssignments: true                                  >> .clang-format
echo AlignConsecutiveDeclarations: true                                 >> .clang-format
echo AlignTrailingComments: true                                        >> .clang-format
echo.                                                                   >> .clang-format
echo # Pointers and references                                          >> .clang-format
echo PointerAlignment: Left                                             >> .clang-format
echo.                                                                   >> .clang-format
echo # Include sorting                                                  >> .clang-format
echo SortIncludes: true                                                 >> .clang-format
echo IncludeBlocks: Regroup                                             >> .clang-format
echo.                                                                   >> .clang-format
echo # Short constructs - keep them expanded for readability            >> .clang-format
echo AllowShortFunctionsOnASingleLine: None                             >> .clang-format
echo AllowShortIfStatementsOnASingleLine: Never                         >> .clang-format
echo AllowShortLoopsOnASingleLine: false                                >> .clang-format
echo AllowShortCaseLabelsOnASingleLine: false                           >> .clang-format
echo.                                                                   >> .clang-format
echo # Empty line between functions/methods                             >> .clang-format
echo SeparateDefinitionBlocks: Always                                   >> .clang-format
echo.                                                                   >> .clang-format
echo # Constructor initializer lists                                    >> .clang-format
echo BreakConstructorInitializers: BeforeColon                          >> .clang-format
echo ConstructorInitializerIndentWidth: 4                               >> .clang-format
echo.                                                                   >> .clang-format
echo # Penalties (controls where clang-format prefers to break lines)   >> .clang-format
echo PenaltyBreakBeforeFirstCallParameter: 100                          >> .clang-format
echo PenaltyReturnTypeOnItsOwnLine: 200                                 >> .clang-format

echo .clang-format created successfully.
echo.

echo Generating .clangd configuration...
echo.

:: Delete existing file first
if exist .clangd del .clangd

:: Create .clangd file
echo CompileFlags:       >> .clangd
echo   CompilationDatabase: debug >> .clangd

echo .clangd created successfully.
echo.

:: Check if clang-format is available
clang-format --version > nul 2>&1
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