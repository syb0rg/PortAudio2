# Locate Apple CoreServices
# CORESERVICES_LIBRARY
# CORESERVICES_FOUND, if false, do not try to link 
# CORESERVICES_INCLUDE_DIR, where to find the headers

find_path(CORESERVICES_INCLUDE_DIR NAMES CoreServices/CoreServices.h)

find_library(CORESERVICES_LIBRARY NAMES CoreServices)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CORESERVICES DEFAULT_MSG CORESERVICES_LIBRARY CORESERVICES_INCLUDE_DIR)

mark_as_advanced(CORESERVICES_INCLUDE_DIR CORESERVICES_LIBRARY)
