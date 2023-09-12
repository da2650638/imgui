project "ImGui"
    kind "StaticLib"
    language "C++"

    targetdir "../../../bin/%{cfg.buildcfg}/%{prj.name}-%{cfg.system}-%{cfg.buildcfg}"
	objdir "../../../bin-int/%{cfg.buildcfg}/%{prj.name}-%{cfg.system}-%{cfg.buildcfg}"

    includedirs 
    { 
        "../../vendor/glfw/include",
        "../imgui",
        "../imgui/backends" 
    }

    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3_loader.h",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3.cpp"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++11"
        staticruntime "On"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++11"
        staticruntime "On"

    filter { "configurations:Debug", "system:linux" }
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release", "system:linux" }
        runtime "Release"
        optimize "on"

    filter { "configurations:Debug", "system:windows" }
        runtime "Debug"
        symbols "on"
        buildoptions "/MTd"

    filter { "configurations:Release", "system:windows" }
        runtime "Release"
        optimize "on"
        buildoptions "/MT"