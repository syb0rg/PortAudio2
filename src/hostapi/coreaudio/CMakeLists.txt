include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_mac_core.c
			pa_mac_core_blocking.c
			pa_mac_core_utilities.c
	)
	
add_library(coreaudio OBJECT ${SOURCES})
set_property(TARGET coreaudio PROPERTY POSITION_INDEPENDENT_CODE TRUE)
