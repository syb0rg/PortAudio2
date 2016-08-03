include_directories(${CMAKE_SOURCE_DIR}/src/common)

SET(SOURCES pa_linux_asihpi.c)

add_library(asihpi OBJECT ${SOURCES})