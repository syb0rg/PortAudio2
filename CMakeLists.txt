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
set(CMAKE_MACOSX_RPATH TRUE)

#SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
INCLUDE_DIRECTORIES(include)
ADD_SUBDIRECTORY(src)

if (WIN32)
	find_package(DXSDK)
	if (DXSDK_FOUND)
		SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:dsound>")
	endif ()

	find_package(ASIOSDK)
	if (ASIOSDK_FOUND)
		SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:asio>")
	endif ()

	SET(OBJECTS 	${OBJECTS}
                    "$<TARGET_OBJECTS:common>"
                    #"$<TARGET_OBJECTS:wasapi>"
                    #"$<TARGET_OBJECTS:wdmks>"
                    "$<TARGET_OBJECTS:wmme>"
                    "$<TARGET_OBJECTS:win>"
		)
	ADD_LIBRARY(${PROJECT_NAME} SHARED ${OBJECTS})
	ADD_LIBRARY(${PROJECT_NAME}_static STATIC ${OBJECTS})
	
	target_link_libraries(${PROJECT_NAME} setupapi winmm)
	target_link_libraries(${PROJECT_NAME}_static setupapi winmm)
else ()
	find_package(ALSA)
	if (ALSA_FOUND)
		SET(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:alsa>"
                                "$<TARGET_OBJECTS:asihpi>"
        )
	endif ()

    find_package(Jack)
    if (JACK_FOUND)
        SET(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:jack>")
    endif ()

    find_package(OSS)
    if (OSS_FOUND)
        SET(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:oss>")
    endif ()
	IF (APPLE)
   		FIND_LIBRARY(COREAUDIO_LIBRARY CoreAudio)
   		FIND_LIBRARY(COREFOUNDATION_LIBRARY CoreFoundation )
		FIND_LIBRARY(CORESERVICES_LIBRARY CoreServices )
		FIND_LIBRARY(CORETOOLBOX_LIBRARY AudioToolbox)
		set(LIBS ${LIBS} ${COREAUDIO_LIBRARY} ${CORESERVICES_LIBRARY} ${COREFOUNDATION_LIBRARY} ${CORETOOLBOX_LIBRARY})
	ENDIF (APPLE)

	SET(OBJECTS 	${OBJECTS}
                    "$<TARGET_OBJECTS:common>"
                    "$<TARGET_OBJECTS:coreaudio>"
                    "$<TARGET_OBJECTS:unix>"
		)
    add_library(${PROJECT_NAME} SHARED ${OBJECTS})
    add_library(${PROJECT_NAME}_static STATIC ${OBJECTS})

	target_link_libraries(${PROJECT_NAME} ${LIBS})
endif ()