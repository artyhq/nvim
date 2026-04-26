return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "go", "nix", "haskell", "c_sharp"
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "go", "nix", "haskell", "cs" },
            callback = function()
                vim.treesitter.start()
            end,
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "go", "nix", "haskell", "cs" },
            callback = function()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
