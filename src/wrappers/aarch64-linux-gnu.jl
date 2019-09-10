# Autogenerated wrapper script for Libcroco_jll for aarch64-linux-gnu
export libcroco

using Glib_jll
using XML2_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libcroco`
const libcroco_splitpath = ["lib", "libcroco-0.6.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcroco_path = ""

# libcroco-specific global declaration
# This will be filled out by __init__()
libcroco_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcroco = "libcroco-0.6.so.3"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Glib_jll.PATH_list, XML2_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Glib_jll.LIBPATH_list, XML2_jll.LIBPATH_list,))

    global libcroco_path = abspath(joinpath(artifact"Libcroco", libcroco_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcroco_handle = dlopen(libcroco_path)
    push!(LIBPATH_list, dirname(libcroco_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

