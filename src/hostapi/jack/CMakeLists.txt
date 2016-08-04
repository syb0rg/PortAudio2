include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_jack.c)

add_library(jack OBJECT ${SOURCES})
set_property(TARGET jack PROPERTY POSITION_INDEPENDENT_CODE TRUE)