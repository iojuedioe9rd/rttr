local RTTR_VERSION_MAJOR  = "1"
local RTTR_VERSION_MINOR  = "0"
local RTTR_VERSION_PATCH  = "0"
local RTTR_VERSION        = RTTR_VERSION_MAJOR .. "." .. RTTR_VERSION_MINOR .. "." .. RTTR_VERSION_PATCH
local RTTR_DEBUG_POSTFIX  = "_d"

local common_files = { "src/rttr/**.hpp", "src/rttr/**.cpp" }
local common_includedirs = { "src" }


project "rttr_core_lib"
   kind "StaticLib"
   targetname "rttr_core"
   files (common_files)
   includedirs (common_includedirs)
   warnings "Extra"

   -- Enable Precompiled Headers
   pchheader "detail/base/pch.h"

   filter "configurations:Debug"
      targetsuffix (RTTR_DEBUG_POSTFIX)
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

   filter "configurations:Dist"
      defines { "NDEBUG", "DIST" }
      optimize "Full"

   filter {}

   filter "system:linux or system:macosx"
      links { "dl" }
   filter {}

   filter "action:vs*"
      targetprefix "lib"
   filter {}
