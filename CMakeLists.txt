# $Id: $
#
# For a "How-To" please refer to the Portaudio documentation at:
# http://www.portaudio.com/trac/wiki/TutorialDir/Compile/CMake
#
CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
SET(PROJECT_NAME portaudio)
PROJECT(${PROJECT_NAME})

INCLUDE(ExternalProject)

SET(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_support)

#SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
INCLUDE_DIRECTORIES(include)
ADD_SUBDIRECTORY(src)

find_package(DXSDK)
find_package(ASIOSDK)

if (WIN32)
	SET(OBJECTS "$<TARGET_OBJECTS:common>" 
				#"$<TARGET_OBJECTS:wasapi>"
				#"$<TARGET_OBJECTS:wdmks>"
				"$<TARGET_OBJECTS:wmme>"
				"$<TARGET_OBJECTS:win>"
		)
	if (ASIOSDK_FOUND)
		SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:asio>")
	endif ()
	
	if (DXSDK_FOUND)
		SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:dsound>")
	endif ()
	ADD_LIBRARY(${PROJECT_NAME} SHARED ${OBJECTS})
	ADD_LIBRARY(${PROJECT_NAME}_static STATIC ${OBJECTS})
	
	target_link_libraries(${PROJECT_NAME} setupapi winmm)
	target_link_libraries(${PROJECT_NAME}_static setupapi winmm)
else ()
	ADD_LIBRARY(${PROJECT_NAME} STATIC
		$<TARGET_OBJECTS:common> 
		$<TARGET_OBJECTS:alsa>
		$<TARGET_OBJECTS:asihpi>
		$<TARGET_OBJECTS:coreaudio>
		$<TARGET_OBJECTS:jack>
		$<TARGET_OBJECTS:oss>
		$<TARGET_OBJECTS:unix>
		)
endif ()