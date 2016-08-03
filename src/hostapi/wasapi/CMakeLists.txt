include_directories(${CMAKE_SOURCE_DIR}/src/common)
include_directories(${CMAKE_SOURCE_DIR}/src/os/win)
include_directories(mingw-include)

set(SOURCES	pa_win_wasapi.c)

add_library(wasapi OBJECT ${SOURCES})