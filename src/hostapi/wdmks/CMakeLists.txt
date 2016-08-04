include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_win_wdmks.c)

add_library(wdmks OBJECT ${SOURCES})
set_property(TARGET wdmks PROPERTY POSITION_INDEPENDENT_CODE TRUE)
