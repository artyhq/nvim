return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- Classic bottom cmdline, no floating popup
        cmdline = {
            view = "cmdline_popup",
        },
        -- LSP: let blink handle completion/signature, noice just prettifies messages
        lsp = {
            override  = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"]                = true,
            },
            progress  = { enabled = true },
            hover     = { enabled = false },
            signature = { enabled = false },
        },
        presets = {
            bottom_search         = true, -- classic /search at bottom
            command_palette       = false,
            long_message_to_split = true,
        },
        -- Minimal notification style, no borders
        views = {
            cmdline_popup = {
                border   = { style = "single" },
                position = { row = "40%", col = "50%" },
                size     = { width = 60, height = "auto" },
            },
            mini = {
                border      = { style = "none" },
                win_options = { winblend = 0 },
            },
            notify = {
                border = { style = "single" },
            },
        }, -- Don't route LSP progress to cmdline (gets noisy)
        routes = {
            {
                filter = { event = "msg_show", kind = "", find = "written" },
                opts   = { skip = true },
            },
        },
    },
}
