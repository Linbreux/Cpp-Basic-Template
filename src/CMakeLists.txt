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

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES main.cpp)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# spdlogger
if(NOT TARGET spdlog)
  # Stand-alone build
  find_package(spdlog REQUIRED)
endif()

find_package(PkgConfig REQUIRED)

find_package(nlohmann_json REQUIRED)
find_package(yaml-cpp REQUIRED)
find_package(Protobuf REQUIRED)

set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost)

# Add executable target with source files listed in SOURCE_FILES variable
include_directories(${Protobuf_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CPPCODEC_ROOT})

add_executable(${CMAKE_PROJECT_NAME} ${SOURCE_FILES}) # ${PROTO_SRCS}
                                                      # ${PROTO_HDRS})

target_include_directories(${CMAKE_PROJECT_NAME}
                           PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")

if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
  target_link_libraries(${CMAKE_PROJECT_NAME} ${Boost_LIBRARIES})
endif()

target_link_libraries(${CMAKE_PROJECT_NAME} nlohmann_json::nlohmann_json
                      spdlog::spdlog yaml-cpp protobuf)
