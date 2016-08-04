include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_linux_alsa.c)

add_library(alsa OBJECT ${SOURCES})
set_property(TARGET alsa PROPERTY POSITION_INDEPENDENT_CODE TRUE)