include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_unix_hostapis.c
			pa_unix_util.c
	)

add_library(unix OBJECT ${SOURCES})
set_property(TARGET unix PROPERTY POSITION_INDEPENDENT_CODE TRUE)
