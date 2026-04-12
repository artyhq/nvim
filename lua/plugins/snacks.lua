return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    init = function()
        vim.g.snacks_animate = false
    end,

    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },

        indent = {
            enabled = true,
            char = "·",

            animate = { enabled = false },
        },

        scope = {
            enabled = true,
            char = "·",

            underline = false,
        },
    },
}
