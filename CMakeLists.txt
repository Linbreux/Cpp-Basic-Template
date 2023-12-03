cmake_minimum_required(VERSION 3.16) # CMake version check

# Only need to fill in this variable if you don't use nix to build your program
set(CMAKE_PROJECT_NAME "my_c++_program")

# Check if there is alread a project name set. If not, use CMAKE_PROJECT_NAME
if(PROJECT_NAME)
  set(PROJECT_NAME ${PROJECT_NAME})
else()
  set(PROJECT_NAME ${CMAKE_PROJECT_NAME})
endif()

project(${PROJECT_NAME}) # Create project

set(CMAKE_CXX_STANDARD 20) # Enable c++20 standard
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(BIN_DIR ${CMAKE_SOURCE_DIR}/bin)

add_subdirectory(src)
add_subdirectory(tests)
