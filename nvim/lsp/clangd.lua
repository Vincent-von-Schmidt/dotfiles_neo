return {
    cmd = { 
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    filetypes = { "c", "cpp", "h", "hpp" },
    root_markers = { ".clangd", "compile_commands.json" },
}
