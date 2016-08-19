# Locate Apple CoreAudio
# COREAUDIO_LIBRARY
# COREAUDIO_FOUND, if false, do not try to link 
# COREAUDIO_INCLUDE_DIR, where to find the headers


find_path(COREAUDIO_INCLUDE_DIR NAMES CoreAudio/CoreAudio.h)

find_library(COREAUDIO_LIBRARY NAMES CoreAudio)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(COREAUDIO DEFAULT_MSG COREAUDIO_LIBRARY COREAUDIO_INCLUDE_DIR)

mark_as_advanced(COREAUDIO_INCLUDE_DIR COREAUDIO_LIBRARY)
