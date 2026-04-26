return {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
    settings = {
        clangd = {
            fallbackFlags = { "-std=c++23" },
        },
    },
}
