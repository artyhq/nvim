return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-mini/mini.icons" },
    lazy = false,
    opts = {
        winopts = {
            border  = "single",
            preview = {
                border = "single",
            },
        },
        fzf_opts = {
            ["--border"] = "none",
            ["--info"]   = "inline",
        },
        files = {
            hidden = true,
        },
    },
}
