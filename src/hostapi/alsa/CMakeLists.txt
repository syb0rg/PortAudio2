include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_linux_alsa.c)

add_library(alsa OBJECT ${SOURCES})