cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
set(PROJECT_NAME portaudio)
project(${PROJECT_NAME})
set(CMAKE_C_STANDARD 99)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_MACOSX_RPATH TRUE)

if (NOT CMAKE_BUILD_TYPE)
    message(STATUS "No build type selected, default to Release")
    set(CMAKE_BUILD_TYPE CACHE Release FORCE)
endif()

if (NOT MSVC)
	set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
	set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -O0 --coverage -pedantic -Wall -Wextra -Wconversion -Wfloat-equal -Wformat=2 -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wold-style-cast -Woverloaded-virtual -Wredundant-decls -Wshadow -Wstack-protector -Wstrict-null-sentinel -Wswitch-default -Wswitch-enum -Wno-unused-parameter -Wctor-dtor-privacy")
endif ()
	
include_directories(include)

add_subdirectory(src)
add_subdirectory(examples)
add_subdirectory(test EXCLUDE_FROM_ALL)
