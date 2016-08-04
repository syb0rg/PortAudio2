include_directories(${CMAKE_SOURCE_DIR}/src/common/)

set(PROGRAMS	pa_devs
                pa_fuzz
                paex_mono_asio_channel_select
                paex_ocean_shore
                paex_pink
                paex_read_write_wire
                paex_record
                paex_record_file
                paex_saw
                paex_sine
                paex_sine_c++
                paex_write_sine
                paex_write_sine_nonint
)

if (WIN32)
	set(PROGRAMS ${PROGRAMS}	paex_wmme_ac3
					paex_wmme_surround
	)
endif ()

foreach (program ${PROGRAMS})
	add_executable(${program} ${program})
	target_link_libraries(${program} ${PROJECT_NAME}_static pthread m)
	set_target_properties (${program} 	
				PROPERTIES
				RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
				)
endforeach ()
