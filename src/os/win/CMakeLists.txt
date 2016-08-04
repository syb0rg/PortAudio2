include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_win_coinitialize.c
			pa_win_hostapis.c
			pa_win_util.c
			pa_win_waveformat.c
			pa_win_wdmks_utils.c
			pa_x86_plain_converters.c
	)
	
add_library(win OBJECT ${SOURCES})
set_property(TARGET win PROPERTY POSITION_INDEPENDENT_CODE TRUE)
