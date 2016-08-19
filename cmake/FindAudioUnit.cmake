# Locate Apple AudioUnit
# AUDIOUNIT_LIBRARY
# AUDIOUNIT_FOUND, if false, do not try to link 
# AUDIOUNIT_INCLUDE_DIR, where to find the headers

find_path(AUDIOUNIT_INCLUDE_DIR NAMES AudioUnit/AudioUnit.h)

find_library(AUDIOUNIT_LIBRARY NAMES AudioUnit)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(AUDIOUNIT DEFAULT_MSG AUDIOUNIT_LIBRARY AUDIOUNIT_INCLUDE_DIR)

mark_as_advanced(AUDIOUNIT_INCLUDE_DIR AUDIOUNIT_LIBRARY)