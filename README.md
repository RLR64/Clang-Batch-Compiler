# Clang Batch Compiler

A comprehensive Windows batch-based compilation toolkit using LLVM Clang for C/C++ development. If you don't have CMake setup and would like to get straight to coding with multiple build configurations, static analysis, and automated workflows using batch files.

## Overview

The Clang Batch Compiler provides a complete suite of batch files for common C/C++ compilation tasks. All executables are created in the current directory alongside your source files. The toolkit is designed for developers who need reliable batch compilation for their C and C++ projects but who don't have a build system like CMake setup.

If you'd like to read about LLVM, here's a great article by Ayman Alheraki on SimplifyC++:

[Understanding LLVM: The Backbone of Modern Compiler Development](https://www.simplifycpp.org/index.php?id=a0639)

**Key Features:**
- **Zero Configuration**: Drop batch files in your project folder and compile immediately
- **Multiple Build Types**: Development, release, sanitized, and threaded compilation modes
- **Static Analysis**: Built-in clang-tidy integration for code quality assurance
- **Auto-Detection**: Automatically finds and compiles all `.c` and `.cpp` files in the directory
- **Modern Standards**: Uses C23 and C++23 by default with strict warning policies
- **Easy Cleanup**: Remove all build artifacts with a single command

## Features

- **Comprehensive Build Support**: Development, release, AddressSanitizer, and threading configurations
- **Modern C/C++ Standards**: C23 and C++23 support with strict compiler warnings
- **Static Analysis Integration**: clang-tidy integration for automated code quality checks
- **Batch Processing**: Process all source files in directory with single command
- **Build Artifact Management**: Clean up executables, object files, and debug information
- **Compiler Information**: Display Clang version, targets, and available LLVM tools
- **Cross-Platform Ready**: Easily adaptable batch scripts for consistent compilation workflows

## File Structure

```
Project Directory/
├── [Your C/C++ source files - .c and .cpp]
├── 0_compile_auto.bat                     # Standard development build
├── 0_compile_auto_fsanitize.bat           # Development build with AddressSanitizer
├── 0_compile_auto_release.bat             # Optimized release build
├── 0_compile_auto_threaded.bat            # Development build with threading support
├── 1_remove.bat                           # Clean up all build artifacts
├── 2_analyze_static.bat                   # Run clang-tidy static analysis
├── 3_compiler_info.bat                    # Display Clang installation information
└── README.md                              # This documentation
```

## Installation

### Prerequisites

- Windows Operating System
- **LLVM Clang** installed and added to PATH (required for all compilation)
- **clang-tidy** (optional, for static analysis - usually included with LLVM)

### Setup

1. **Install LLVM Clang**:
   - Download from [https://github.com/llvm/llvm-project/releases](https://github.com/llvm/llvm-project/releases)
   - Run the installer and ensure "Add LLVM to system PATH" is checked
   - Verify installation by running `clang --version` in Command Prompt

2. **Download the Clang Batch Compiler**:
```bash
git clone https://github.com/RLR64/Clang-Batch-Compiler
```

3. Copy the batch files to your C/C++ project directory and you're ready to compile your code!

## Usage

### Step-by-Step Workflow

#### Step 1: Prepare Your Source Files
1. Place your `.c` and `.cpp` files in the same directory as the batch files
2. Supported standards: C23 for C files, C++23 for C++ files
3. Files are processed from the current directory only

#### Step 2: Choose Compilation Mode

**Standard Development Build:**
Use for regular development with debug information and strict warnings.
- **Command**: `0_compile_auto.bat`
- **Flags**: `-std=c23/c++23 -Wall -Wextra -Werror -g -O0`
- **Use case**: Daily development, debugging

**AddressSanitizer Build:**
Use for memory debugging and detecting memory-related issues.
- **Command**: `0_compile_auto_fsanitize.bat`
- **Flags**: Standard flags + `-fsanitize=address`
- **Use case**: Memory leak detection, buffer overflow detection

**Release Build:**
Use for optimized production builds.
- **Command**: `0_compile_auto_release.bat`
- **Flags**: `-std=c23/c++23 -Wall -Wextra -Werror -O2`
- **Use case**: Final builds, performance testing

**Threading Build:**
Use for applications using threading libraries.
- **Command**: `0_compile_auto_threaded.bat`
- **Flags**: Standard flags + `-pthread`
- **Use case**: Multi-threaded applications, concurrent programming

#### Step 3: Static Analysis

Run automated code quality analysis:
- **Command**: `2_analyze_static.bat`
- **Tool**: Uses clang-tidy for comprehensive static analysis
- **Output**: Identifies potential issues, coding standard violations

#### Step 4: System Information

Check your Clang installation and available features:
- **Command**: `3_compiler_info.bat`
- **Output**: Clang version, supported targets, available LLVM tools

#### Step 5: Cleanup

Remove all build artifacts:
- **Command**: `1_remove.bat`
- **Removes**: `.exe`, `.obj`, `.pdb`, `.ilk` files

## Compilation Specifications

### Development Build (`0_compile_auto.bat`)
- **C Standard**: C23
- **C++ Standard**: C++23
- **Optimization**: None (`-O0`)
- **Debug Info**: Full (`-g`)
- **Warnings**: All warnings as errors (`-Wall -Wextra -Werror`)

### Release Build (`0_compile_auto_release.bat`)
- **Standards**: C23/C++23
- **Optimization**: Level 2 (`-O2`)
- **Debug Info**: None
- **Warnings**: All warnings as errors

### AddressSanitizer Build (`0_compile_auto_fsanitize.bat`)
- **Base**: Development build configuration
- **Additional**: AddressSanitizer (`-fsanitize=address`)
- **Purpose**: Memory error detection

### Threading Build (`0_compile_auto_threaded.bat`)
- **Base**: Development build configuration
- **Additional**: POSIX threads (`-pthread`)
- **Purpose**: Multi-threaded application support

## Recommended Workflows

### Workflow 1: Standard Development
1. Write your C/C++ source code
2. Run `0_compile_auto.bat` for development builds
3. Test your executables
4. Run `2_analyze_static.bat` for code quality checks
5. Clean up with `1_remove.bat` when done

### Workflow 2: Memory Debugging
1. Compile with `0_compile_auto_fsanitize.bat`
2. Run executables to detect memory issues
3. Address any AddressSanitizer reports
4. Recompile with standard build for final testing

### Workflow 3: Release Preparation
1. Ensure code passes static analysis (`2_analyze_static.bat`)
2. Test with development build (`0_compile_auto.bat`)
3. Build optimized release version (`0_compile_auto_release.bat`)
4. Perform final testing on release build

### Workflow 4: Threading Development
1. Use `0_compile_auto_threaded.bat` for pthread-based applications
2. Test concurrent functionality
3. Run with AddressSanitizer to catch threading issues
4. Build release version when stable

## Output Behavior

- **Executable Location**: Created in the same directory as source files
- **Naming Convention**: `filename.exe` (matches source file name)
- **Batch Processing**: All matching files in directory are compiled
- **Error Handling**: Compilation failures are reported with detailed error messages
- **Summary Reporting**: Each batch file provides compilation statistics

## Troubleshooting

### Common Issues

**"clang not recognized" error**
- Ensure LLVM Clang is installed and added to system PATH
- Try running `clang --version` in Command Prompt to verify installation
- Run `3_compiler_info.bat` to check installation status
- Restart Command Prompt after installing LLVM

**Compilation failures with `-Werror`**
- The scripts use strict warning policies that treat warnings as errors
- Review compiler output for specific warning details
- Fix warnings or temporarily modify batch files to remove `-Werror`

**Static analysis not available**
- clang-tidy may not be installed with your LLVM distribution
- Run `3_compiler_info.bat` to check clang-tidy availability
- Install complete LLVM package or add clang-tidy separately

**Threading compilation issues**
- Ensure your system supports pthread
- Windows users may need additional threading library setup
- Consider using Windows threading APIs instead of pthread

**No source files found**
- Verify `.c` and `.cpp` files exist in the current directory
- Check file extensions match expected patterns
- Ensure files are not in subdirectories

## Performance Tips

1. **Use appropriate build types**: Development for debugging, release for performance
2. **Leverage static analysis**: Catch issues early with `2_analyze_static.bat`
3. **Clean regularly**: Use `1_remove.bat` to manage disk space
4. **Check compiler info**: Run `3_compiler_info.bat` to understand your setup
5. **Batch efficiently**: Process multiple files simultaneously with single commands

## Customization

### Modifying Compilation Flags
Edit batch files to customize compilation behavior:

```batch
# Change C++ standard
clang++ -std=c++20 ...

# Add custom preprocessor definitions
clang -DDEBUG -DVERSION=1.0 ...

# Include additional directories
clang -I./include -I./lib ...

# Link external libraries
clang -lmath -lpthread ...
```

### Adding New Build Configurations
Create additional batch files following the naming convention:
- `0_*`: Primary compilation scripts
- `1_*`: Cleanup and maintenance
- `2_*`: Analysis and tools
- `3_*`: Information and diagnostics

## Contributing

Contributions are welcome! Areas for improvement:
- Additional compilation profiles (profile-guided optimization, cross-compilation)
- Integration with other LLVM tools (clang-format, scan-build)
- Enhanced static analysis configurations
- Support for external libraries and frameworks

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built for C/C++ developers who value simplicity and efficiency
- Powered by LLVM Clang for modern, standards-compliant compilation
- Designed for Windows development environments
- Created for developers who prefer lightweight, scriptable build tools

## Attribution
Icon designed by Abdulla Ashraf from iconfinder ([author profile](https://www.iconfinder.com/Black-man))
Edited with a black glow.

LLVM Logo from the LLVM Foundation ([llvm.org](https://llvm.org))
Edited with a black glow.

---

**Note**: This toolkit is designed for Windows environments since batch files only work on Windows and requires the correct LLVM Clang setup. All scripts maintain strict compilation standards while providing flexible, automated build workflows.