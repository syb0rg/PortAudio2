include_directories(${CMAKE_SOURCE_DIR}/src/os/unix)
include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_unix_oss.c
		recplay.c
	)
	
add_library(oss OBJECT ${SOURCES})
set_property(TARGET oss PROPERTY POSITION_INDEPENDENT_CODE TRUE)
