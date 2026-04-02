cmake_minimum_required(VERSION 4.3)

# Project Name and Lanuage
project(hello_world CXX)

# Set C++ Standard
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Generate compile_commands.json for ClangD
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Enable warnings and debugging symbols
add_compile_options(-Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow -g -O0)

# Include headers from include/
include_directories(include)

# Compile executable
add_executable(hello_world
    src/main.cpp
)
