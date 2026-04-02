@echo off

echo Generating .clang-tidy configuration...
echo.

:: Delete existing .clang-tidy file first to avoid appending to old content
if exist .clang-tidy del .clang-tidy

:: Header / strategy comment
echo # .clang-tidy                                                                          >> .clang-tidy
echo.                                                                                       >> .clang-tidy
echo # Strategy: opt into specific useful categories only.                                  >> .clang-tidy
echo # Excluded project/platform specific prefixes:                                         >> .clang-tidy
echo #   llvm, llvmlibc, google, android, apple, darwin, objc,                              >> .clang-tidy
echo #   fuchsia, zircon, altera, mpi, openmp, linuxkernel, abseil, boost                   >> .clang-tidy
echo.                                                                                       >> .clang-tidy
echo # Run check-only on a C++ file example:   clang-tidy src/main.cpp                      >> .clang-tidy
echo # Run with fixes on a C++ file example:   clang-tidy --fix/src/main.cpp                >> .clang-tidy
echo.                                                                                       >> .clang-tidy
echo # Run check-only on a C file example:   clang-tidy src/main.c                          >> .clang-tidy
echo # Run with fixes on a C file example:   clang-tidy --fix/src/main.c                    >> .clang-tidy
echo.                                                                                       >> .clang-tidy

:: Checks block
echo Checks: ^>                                                                             >> .clang-tidy
echo   -*,                                                                                  >> .clang-tidy
echo   bugprone-*,                                                                          >> .clang-tidy
echo   -bugprone-easily-swappable-parameters,                                               >> .clang-tidy
echo   -bugprone-exception-escape,                                                          >> .clang-tidy
echo   cppcoreguidelines-init-variables,                                                    >> .clang-tidy
echo   cppcoreguidelines-misleading-capture-default-by-value,                               >> .clang-tidy
echo   cppcoreguidelines-no-malloc,                                                         >> .clang-tidy
echo   cppcoreguidelines-prefer-member-initializer,                                         >> .clang-tidy
echo   cppcoreguidelines-pro-type-const-cast,                                               >> .clang-tidy
echo   cppcoreguidelines-pro-type-cstyle-cast,                                              >> .clang-tidy
echo   cppcoreguidelines-pro-type-member-init,                                              >> .clang-tidy
echo   cppcoreguidelines-pro-type-reinterpret-cast,                                         >> .clang-tidy
echo   cppcoreguidelines-slicing,                                                           >> .clang-tidy
echo   cppcoreguidelines-special-member-functions,                                          >> .clang-tidy
echo   cppcoreguidelines-virtual-class-destructor,                                          >> .clang-tidy
echo   misc-const-correctness,                                                              >> .clang-tidy
echo   misc-redundant-expression,                                                           >> .clang-tidy
echo   misc-unused-alias-decls,                                                             >> .clang-tidy
echo   misc-unused-parameters,                                                              >> .clang-tidy
echo   misc-unused-using-decls,                                                             >> .clang-tidy
echo   modernize-avoid-bind,                                                                >> .clang-tidy
echo   modernize-loop-convert,                                                              >> .clang-tidy
echo   modernize-make-shared,                                                               >> .clang-tidy
echo   modernize-make-unique,                                                               >> .clang-tidy
echo   modernize-pass-by-value,                                                             >> .clang-tidy
echo   modernize-redundant-void-arg,                                                        >> .clang-tidy
echo   modernize-replace-auto-ptr,                                                          >> .clang-tidy
echo   modernize-use-auto,                                                                  >> .clang-tidy
echo   modernize-use-bool-literals,                                                         >> .clang-tidy
echo   modernize-use-default-member-init,                                                   >> .clang-tidy
echo   modernize-use-emplace,                                                               >> .clang-tidy
echo   modernize-use-equals-default,                                                        >> .clang-tidy
echo   modernize-use-equals-delete,                                                         >> .clang-tidy
echo   modernize-use-nodiscard,                                                             >> .clang-tidy
echo   modernize-use-noexcept,                                                              >> .clang-tidy
echo   modernize-use-nullptr,                                                               >> .clang-tidy
echo   modernize-use-override,                                                              >> .clang-tidy
echo   modernize-use-using,                                                                 >> .clang-tidy
echo   performance-*,                                                                       >> .clang-tidy
echo   readability-*,                                                                       >> .clang-tidy
echo   concurrency-mt-unsafe,                                                               >> .clang-tidy
echo.                                                                                       >> .clang-tidy

:: Warnings and format
echo # Treat all enabled checks as warnings (not errors).                                   >> .clang-tidy
echo # Change to true once the codebase is clean to enforce on CI.                          >> .clang-tidy
echo WarningsAsErrors: false                                                                >> .clang-tidy
echo.                                                                                       >> .clang-tidy
echo # Apply fixes with clang-format style from .clang-format file.                         >> .clang-tidy
echo FormatStyle: file                                                                      >> .clang-tidy
echo.                                                                                       >> .clang-tidy

:: Naming Conventions
echo # Naming conventions - CamelCase for functions and methods,                            >> .clang-tidy
echo # m_ prefix for private member variables                                               >> .clang-tidy
echo CheckOptions:                                                                          >> .clang-tidy
echo   - key: readability-identifier-naming.FunctionCase                                    >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.MethodCase                                      >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.VariableCase                                    >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.ParameterCase                                   >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.MemberPrefix                                    >> .clang-tidy
echo     value: m_                                                                          >> .clang-tidy
echo   - key: readability-identifier-naming.ClassCase                                       >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.StructCase                                      >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.EnumCase                                        >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.EnumConstantCase                                >> .clang-tidy
echo     value: CamelCase                                                                   >> .clang-tidy
echo   - key: readability-identifier-naming.ConstantCase                                    >> .clang-tidy
echo     value: UPPER_CASE                                                                  >> .clang-tidy
echo   - key: modernize-use-auto.MinTypeNameLength                                          >> .clang-tidy
echo     value: 5                                                                           >> .clang-tidy
echo   - key: misc-unused-parameters.StrictMode                                             >> .clang-tidy
echo     value: false                                                                       >> .clang-tidy

echo .clang-tidy created successfully.
echo.
