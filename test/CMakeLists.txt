include_directories(${CMAKE_SOURCE_DIR}/src/common)

set(TESTS	pa_minlat
			patest1
			patest_buffer
			patest_callbackstop
			patest_clip
			patest_converters
			patest_dither
			patest_dsound_find_best_latency_params
			patest_dsound_low_level_latency_params
			patest_dsound_surround
			patest_hang
			patest_in_overflow
			patest_jack_wasapi
			patest_latency
			patest_leftright
			patest_longsine
			patest_many
			patest_maxsines
			patest_mono
			patest_multi_sine
			patest_out_underflow
			patest_prime
			patest_read_record
			patest_ringmix
			patest_sine8
			patest_sine_channelmaps
			patest_sine_formats
			patest_sine_srate
			patest_sine_time
			patest_start_stop
			patest_stop
			patest_stop_playout
			patest_suggested_vs_streaminfo_latency
			patest_sync
			patest_timing
			patest_toomanysines
			patest_two_rates
			patest_underflow
			patest_unplug
			patest_wire
			patest_wmme_find_best_latency_params
			patest_wmme_low_level_latency_params
			patest_write_stop
)

enable_testing()
add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND} DEPENDS ${TESTS})
set(CMAKE_CTEST_COMMAND ctest -V)

foreach (test ${TESTS})
	add_executable(${test} ${CMAKE_SOURCE_DIR}/test/${test})
	target_link_libraries(${test} ${PROJECT_NAME})
	set_target_properties(${test}
							PROPERTIES
							RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
				)
	add_test(NAME ${test} 
		 	 COMMAND ${test} all
		 	 WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
	add_dependencies(check ${test})
endforeach ()