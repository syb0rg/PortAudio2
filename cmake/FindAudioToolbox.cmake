# Locate Apple AudioToolbox
# AUDIOTOOLBOX_LIBRARY
# AUDIOTOOLBOX_FOUND, if false, do not try to link 
# AUDIOTOOLBOX_INCLUDE_DIR, where to find the headers

find_path(AUDIOTOOLBOX_INCLUDE_DIR NAMES AudioToolbox/AudioToolbox.h)

find_library(AUDIOTOOLBOX_LIBRARY NAMES AudioToolbox)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(AUDIOTOOLBOX DEFAULT_MSG AUDIOTOOLBOX_LIBRARY AUDIOTOOLBOX_INCLUDE_DIR)

mark_as_advanced(AUDIOTOOLBOX_INCLUDE_DIR AUDIOTOOLBOX_LIBRARY)
