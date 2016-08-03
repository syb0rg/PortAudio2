if	(WIN32)
	if (ASIOSDK_FOUND)
		add_subdirectory(asio)
	endif ()
	
	if (DXSDK_FOUND)
		add_subdirectory(dsound)
	endif ()

	add_subdirectory(wasapi)
	add_subdirectory(wdmks)
	add_subdirectory(wmme)
else ()
	if (ALSA_FOUND)
		add_subdirectory(alsa)
		add_subdirectory(asihpi)
	endif ()

	if (JACK_FOUND)
		add_subdirectory(jack)
	endif ()
	
	if(OSS_FOUND)
		add_subdirectory(oss)
	endif()

	if(APPLE)
		add_subdirectory(coreaudio)
	endif()
endif ()

