return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "nvim-mini/mini.icons" },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { enabled = true },
    
    completion = {
      menu = { border = "rounded" },
      documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
    },
  },
}
