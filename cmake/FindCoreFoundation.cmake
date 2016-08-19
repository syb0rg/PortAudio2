# Locate Apple CoreFoundation
# COREFOUNDATION_LIBRARY
# COREFOUNDATION_FOUND, if false, do not try to link to gdal 
# COREFOUNDATION_INCLUDE_DIR, where to find the headers

find_path(COREFOUNDATION_INCLUDE_DIR CoreFoundation/CoreFoundation.h)

find_library(COREFOUNDATION_LIBRARY CoreFoundation)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(COREFOUNDATION DEFAULT_MSG COREFOUNDATION_LIBRARY COREFOUNDATION_INCLUDE_DIR)

mark_as_advanced(COREFOUNDATION_INCLUDE_DIR COREFOUNDATION_LIBRARY)