include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_linux_asihpi.c)

add_library(asihpi OBJECT ${SOURCES})
set_property(TARGET asihpi PROPERTY POSITION_INDEPENDENT_CODE TRUE)