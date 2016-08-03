include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_unix_oss.c
			recplay.c
	)
	
add_library(oss OBJECT ${SOURCES})
