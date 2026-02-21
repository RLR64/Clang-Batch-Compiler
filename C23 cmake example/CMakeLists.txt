cmake_minimum_required(VERSION 4.2)

# Project Name and Lanuage
project(hello_world C)

# Set C Standard
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Generate compile_commands.json for ClangD
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Enable warnings and debugging symbols
add_compile_options(-Wall -Wcast-align -Wconversion -Wdouble-promotion -Werror -Wextra -Wformat=2 -Wnull-dereference -Wpedantic -Wshadow -g -O0)

# Include headers from include/
include_directories(include)

# Compile executable
add_executable(hello_world
    src/main.c
)
