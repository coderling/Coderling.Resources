package("EASTLLIB")
    set_description("pre build eastl")
    on_load(function (package)
        package:set("installdir", path.join(os.scriptdir(), package:plat(), package:arch(), package:mode()))
        package:add("defines", "EASTL_USER_DEFINED_ALLOCATOR", "EASTDC_USE_STANDARD_NEW=1")

        if package:mode() == "debug" or package:mode() == "releasedbg" then--is_mode("debug") or is_mode("releasedbg") then
            package:add("defines", "EASTL_NAME_ENABLED")
        end
    end)

    on_fetch(function (package)
        local result = {}
        result.links = "EASTL"
        result.linkdirs = package:installdir("lib")
        result.includedirs = package:installdir("include")
        return result
    end)