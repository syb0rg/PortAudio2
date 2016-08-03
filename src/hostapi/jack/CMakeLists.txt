include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_jack.c)

add_library(jack OBJECT ${SOURCES})