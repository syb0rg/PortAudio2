include_directories(${CMAKE_SOURCE_DIR}/src/common)
include_directories(${CMAKE_SOURCE_DIR}/src/os/win)

SET(SOURCES	iasiothiscallresolver.cpp
			pa_asio.cpp
	)
	
add_library(asio OBJECT ${SOURCES})
set_property(TARGET asio PROPERTY POSITION_INDEPENDENT_CODE TRUE)