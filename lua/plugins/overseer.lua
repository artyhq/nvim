return {
    "stevearc/overseer.nvim",
    cmd  = { "OverseerRun", "OverseerToggle", "OverseerBuild" },
    opts = {
        task_list = {
            direction = "bottom",
            bindings  = {
                ["q"] = "Close",
                ["<CR>"] = "OpenOutput",
            },
        },
        -- No rounded borders
        form     = { border = "single" },
        confirm  = { border = "single" },
        task_win = { border = "single" },
    },
}
