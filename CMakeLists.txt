cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
set(PROJECT_NAME portaudio)
project(${PROJECT_NAME})

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_MACOSX_RPATH TRUE)

include_directories(include)

add_subdirectory(src)
add_subdirectory(examples)
add_subdirectory(test EXCLUDE_FROM_ALL)