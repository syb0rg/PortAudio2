include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_win_ds.c
			pa_win_ds_dynlink.c
	)
	
add_library(dsound OBJECT ${SOURCES})