local key = vim.keymap.set
local fzf = require("fzf-lua")
local snacks = require("snacks")

fzf.setup({
    winopts = {
        backdrop = 100,
    }
})

require("which-key").add({
    { "<leader>f", group = "Files" },
    { "<leader>q", group = "Quit" },
    { "<leader>g", group = "Go(to)" },
    { "<leader>c", group = "Code" },
    { "<leader>b", group = "Buffers" },
    { "<leader>h", group = "Help" },
})

-- group: (f)iles --
key("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file", })
key("n", "<leader>ff", fzf.files, { desc = "Find files" })
key("n", "<leader>fg", fzf.live_grep, { desc = "Grep files" })
key("n", "<leader>ff", fzf.files, { desc = "Find files" })

-- group: (q)uit --
key("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Safe quit (all)" })
key("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force quit (all)" })

-- group: (g)o --
key("n", "<leader>gd", fzf.lsp_definitions, { desc = "Go to definition" })
key("n", "<leader>gr", fzf.lsp_references, { desc = "Go to reference" })

-- group: (c)ode --
key("n", "<leader>cs", fzf.lsp_document_symbols, { desc = "File symbols (functions, classes, etc)" })

-- group: (c)ode --
key("n", "<leader>bb", function()
    fzf.buffers({
        sort_mru = true,
        ignore_current_buffer = true,
        winopts = {
            split = "botright new",      
            preview = {
                layout = "vertical",
            }
        }
    })
end, { desc = "Buffer switch" })
key("n", "<leader>bd", function() 
  require("snacks").bufdelete()
  end, { desc = "Save buffer delete" })

-- group: (h)elp --
key("n", "<leader>hn", fzf.help_tags, { desc = "Search nvim docs" })

-- Aliases --
-- NOT DISPLAYED BY which-key PLUGIN
key({ "n", "v" }, "-", "<cmd>Oil<cr>", { desc = "Open Oil", silent = true })
