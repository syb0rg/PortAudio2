#
# common source files
#

SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:common>")

#
# Windows audio frameworks
#

find_package(ASIOSDK)
if (ASIOSDK_FOUND)
	set(PA_USE_ASIHPI TRUE)
	add_subdirectory(asio)
	set(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:asio>")
endif ()

find_package(DXSDK)
if (DXSDK_FOUND)
	set(PA_USE_DS TRUE)
	add_subdirectory(dsound)
	set(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:dsound>")
endif ()

find_package(WASAPI)
if (WASAPI_FOUND)
	set(PA_USE_WASAPI TRUE)
	add_subdirectory(wasapi)
	SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:wasapi>")
endif ()

#
# Unix audio frameworks
#

find_package(ALSA)
if (ALSA_FOUND)
	set(PA_USE_ALSA TRUE)
	add_subdirectory(alsa)
	add_subdirectory(asihpi)

	set(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:alsa>"
							"$<TARGET_OBJECTS:asihpi>"
	)
endif ()

find_package(Jack)
if (JACK_FOUND)
	set(PA_USE_JACK TRUE)
	add_subdirectory(jack)
	set(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:jack>")
endif ()

find_package(OSS)
if (OSS_FOUND)
	set(PA_USE_OSS TRUE)
	add_definitions(-DHAVE_SYS_SOUNDCARD_H)
	add_subdirectory(oss)
	set(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:oss>")
endif()

find_package(CoreAudio)
if (COREAUDIO_FOUND)
	set(PA_USE_COREAUDIO TRUE)
	add_subdirectory(coreaudio)
	SET(OBJECTS ${OBJECTS}  "$<TARGET_OBJECTS:coreaudio>")
	
	set(LIBS ${LIBS} ${COREAUDIO_LIBRARY})
endif()

#
# final OS library setup
#

if (WIN32)
    SET(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:win>")
	
	add_library(${PROJECT_NAME} SHARED ${OBJECTS})
	add_library(${PROJECT_NAME}_static STATIC ${OBJECTS})

	target_link_libraries(${PROJECT_NAME} setupapi winmm)
	target_link_libraries(${PROJECT_NAME}_static setupapi winmm)
else (UNIX)
    set(OBJECTS ${OBJECTS} "$<TARGET_OBJECTS:unix>")
	
	add_library(${PROJECT_NAME} SHARED ${OBJECTS})
	add_library(${PROJECT_NAME}_static STATIC ${OBJECTS})

	target_link_libraries(${PROJECT_NAME} ${LIBS} pthread m)
	target_link_libraries(${PROJECT_NAME}_static ${LIBS} pthread m)
endif ()

configure_file(${CMAKE_SOURCE_DIR}/src/common/pa_hostapi.h.in ${CMAKE_SOURCE_DIR}/src/common/pa_hostapi.h)
