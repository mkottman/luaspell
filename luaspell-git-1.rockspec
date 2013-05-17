package = "luaspell"
version = "git-1"

description = {
    summary = "Lua binding to libhunspell",
    detailed = [[
A Lua binding to the Hunspell spell checking engine. It is a thin wrapper over libhunspell.
]],
    homepage = "https://github.com/mkottman/luaspell",
    license = "MIT"
}

source = {
    url = "git://github.com/mkottman/luaspell.git",
    dir = "luaspell"
}

dependencies = {
    "lua >= 5.1, < 5.2"
}

external_dependencies = {

}
build = {
   type = "cmake",
   variables = {
   	INSTALL_CMOD      = "$(LIBDIR)",
	CMAKE_BUILD_TYPE  = "$(CMAKE_BUILD_TYPE)",
	["CFLAGS:STRING"] = "$(CFLAGS)"
   }
}

