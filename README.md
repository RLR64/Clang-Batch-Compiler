# Clang Batch Compiler

A collection of Windows batch scripts for efficient C/C++ development using Clang/LLVM. Simplifies compilation, project generation, code formatting, and static analysis with modern C23 and C++26 support.

## Features

- **Quick compilation scripts** - Auto-detect and compile C/C++ files with various configurations
- **CMake project templates** - Generate ready-to-use C23 and C++26 projects
- **Code quality tools** - Integrated clang-format and clang-tidy support
- **Multiple build modes** - Debug, Release, Sanitizer, and Threading configurations
- **Standard detection utilities** - Verify C/C++ standard compliance

## Prerequisites

- **Clang** 22 or newer
- **CMake** 4.3.0 or newer
- **Ninja** 1.13 or newer

If you are on Windows you can run `winget -upgrade` to show the list of programs that need updating and then run `winget -upgrade --all` which can upgrade LLVM/Clang and CMake.
With Ninja you will have to update it manually and simply replace the exe with the new one that you get here (https://github.com/ninja-build/ninja/releases)
Here is how to setup LLVM on Windows (https://www.youtube.com/watch?v=WNvL4hGid3Y)

## Quick Compilation Scripts

### Standard Builds

- `0_compile_auto.bat` - Debug build with C23/C++26 standards
- `0_compile_auto_release.bat` - Optimized release build with `-O3` and `-DNDEBUG` flags
- `0_compile_auto_thread.bat` - Debug build with pthread support
- `0_compile_auto_fsanitize.bat` - Debug build with AddressSanitizer

### Utility Scripts

- `1_remove.bat` - Clean build artifacts (`.exe`, `.obj`, `.pdb`, `.ilk`)
- `2_static_analysis.bat` - Run clang-tidy on all C/C++ files
- `3_compiler_info.bat` - Display Clang version and available LLVM tools
- `4_setup_clang_format_clangd.bat` - Generate a custom LLVM `.clang-format` file and `.clangd` file used for debug
- `4_setup_clang_tidy.bat` - Generate a custom `.clang-tidy` file

### Project Generators

- `5_generate_c_project.bat` - Create C23 Hello World project with CMake setup
- `5_generate_cpp_project.bat` - Create C++26 Hello World project with CMake setup

You can check what the CMakelists.txt and CMakePresets.json file that you can find in the CMake Examples for both C23 and C++26
Feel free to edit them to your needs

## Usage

### Quick Compilation

Place your `.c` or `.cpp` files in the same directory as the scripts and run the desired batch file:
```batch
0_compile_auto.bat              # Standard debug build
0_compile_auto_release.bat      # Optimized release build
0_compile_auto_fsanitize.bat    # With memory safety checks
0_compile_auto_thread.bat       # With threading support
```

Scripts automatically:
- Detect and compile all C/C++ files in current directory
- Detect and apply fixes using `.clang-tidy`
- Apply strict compiler warning flags
- Use C23 Standard for `.c` files and C++26 Standard for `.cpp` files
- You can always edit and change them later to your liking 
- Report compilation statistics like whic files compiled successful or failed

### Generate New Project

```batch
5_generate_cpp_project.bat      # Create C++26 hello world project
5_generate_c_project.bat        # Create C23 hello world project
```

Creates the following project structure:

```
your-project/
├── src/
│   └── main.cpp (or main.c)
├── include/
├── debug/
├── release/
├── CMakeLists.txt
└── CMakePresets.json
```

### Build with CMake

```batch
# Debug build
cmake --preset debug
cmake --build debug/
debug/hello_world.exe

# Release build
cmake --preset release
cmake --build release/
release/hello_world.exe
```

### Code Quality

```batch
4_setup_clang_tidy.bat               # Applies warnings and fixes to all C/C++ files
4_setup_clang_format_clangd.bat      # Format all C/C++ files and generates a clangd file
2_static_analysis.bat                # Run static analysis
1_remove.bat                         # Clean build artifacts
```

## Compiler Flags

### Debug Builds

**Standards:** `-std=c23` / `-std=c++26`
**Warnings:** `-Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow`
**Debug:** `-g -O0`

### Release Builds

**Optimization:** `-O3 -DNDEBUG`
- All warning flags enabled

### Sanitizer Builds

**Sanitizers:** `-fsanitize=address,undefined`
- All debug flags enabled

## CMake Configuration

Generated projects include the following:

### CMakeLists.txt
- C23 / C++26 standard enforcement
- Strict compiler warnings
- `compile_commands.json` generation for ClangD
- Clean project structure

### CMakePresets.json

**Debug preset:** 
- Full debugging symbols, no optimization

**Release preset:** Maximum optimization
- Ninja generator for fast builds
- Separate build directories (`debug/` and `release/`)

**CMake Commands For Debug Build**
- cmake --preset debug
- cmake --build debug/

**CMake Commands For Release Build**
- cmake --preset release
- cmake --build release/

## Examples

Check the included example directories for complete working projects:
- `C++26 CMake Example/` - Hello World C++ project template
- `C23 CMake Example/` - Hello World C project template

Each example includes:
- Complete `CMakeLists.txt` and `CMakePresets.json`
- Sample source files
- Ready-to-build structure

## Standard C and C++ Detection

There is an included print_c_standard.c and print_cpp_standard.cpp files included where you can run the 0_compile_auto.bat file which will compile both of the files into their own exes.

When running them they will tell you which Standard you are using and the code is a edited version on learncpp 

## Notes

- All compilation scripts process files in the current directory
- CMake projects use separate `debug/` and `release/` build directories
- Original files remain untouched during processing
- clang-format uses a custom LLVM style format for all .c .h .cpp and .hpp files
- Like to give a shoutout to Erarnitox on showing in the Droplet project how to setup the CMakePresets.json file (Big help with this one!)
- (https://github.com/Erarnitox/Droplet/blob/main/CMakePresets.json)

## Learning Resources

- Here are some resources you can check out if you want to learn C and C++ programming 🔥

### C Programming

- [C Reference](https://en.cppreference.com/w/c) - Comprehensive C language reference
- [Learn C (Boot.dev)](https://www.boot.dev/courses/learn-memory-management-c) - Interactive C course on Boot Dev
- [Learn C (YouTube)](https://www.youtube.com/watch?v=rJrd2QMVbGM) - Video tutorial on Boot Dev YouTube Channel
- [Mastering C23](https://simplifycpp.org/books/cpp/Mastering_C23.pdf) - Guide to Low-Level Programming
- [C Programming](https://simplifycpp.org/books/cpp/C23_Deep_Dive_into_Modern_Power_for_Systems_and_Classic_C_Programmers.pdf) - C23 Deep Dive

### C++ Programming

- [C++ Reference](https://en.cppreference.com/w/cpp) - Comprehensive C++ language reference
- [LearnCpp.com](https://www.learncpp.com/) - Free comprehensive C++ tutorial
- [CppCon YouTube](https://www.youtube.com/@CppCon) - Conference talks on modern C++
- [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines) - Best practices by Bjarne Stroustrup
- [C++ Book Series](https://simplifycpp.org/?id=cp) - A collection of specialized books covering all areas of modern C++
- [Learn Modern C++23](https://www.youtube.com/playlist?list=PLTjUlazALHSBQp4jdqHTCduTSSMU-cz5P) - Erarnitox course on C++23
- [Jason Turner](https://www.youtube.com/@cppweekly) - Great C++ channel
- [MetalSilicon](https://www.youtube.com/@MetalSiliconYT) - Great channel on helping everyone understand low level Software Engineering

### Online C++ Tools

- [Compiler Explorer](https://compiler-explorer.com) - See how your code compiles
- [C++ Insights](https://cppinsights.io/) - See what the compiler does with your code
- [Quick Bench](https://quick-bench.com/) - Benchmark your C++ code online
- [C++ Draft Search](https://wg21.cmeerw.net/cppdraft/search) - Search the C++ standard draft
- [C++ Working Draft](https://eel.is/c++draft/) - Official C++ standard draft
- [C++ Standard Search](https://search.cpp-lang.org/) - Fast standard search
- [C++ Evolution](https://cppevo.dev/) - Track C++ language evolution
- [C++ Status](https://cppstat.org/) - Compiler support for C++ features

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## References/Attribution

- [C/C++ Documentation](https://en.cppreference.com/w/)
- [Clang Support Status](https://cppstat.org/?tags=cpp,c,clang)
- [LLVM Project](https://llvm.org/)
- [CMake Documentation](https://cmake.org/documentation/)
- [Learn C++](https://www.learncpp.com/)
- [Erarnitox](https://github.com/Erarnitox)