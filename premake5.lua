require "build/ninja"

workspace "attenua"
	location "build"
	configurations {"debug", "release"}

	filter "configurations:debug"
		defines {"DEBUG"}
		flags {"Symbols"}

	filter "configurations:release"
		defines {"NDEBUG"}
		optimize "On"

project "attenua"
	kind "StaticLib"
	location "build"
	language "C++"
	targetdir "bin/attenua"

	files {"src/attenua/**.cpp"}
	includedirs {"lib", "src/attenua/"}

project "test-experimental"
	kind "ConsoleApp"
	location "build"
	language "C++"
	targetdir "bin/test-experimental"
	links "attenua"

	files {"src/test-experimental/**.cpp"}
	includedirs {"lib", "src/test-experimental/"}
