include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES	pa_win_wmme.c)

add_library(wmme OBJECT ${SOURCES})