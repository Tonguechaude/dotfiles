require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    blink_cmp = true,
    gitsigns = true,
    treesitter = true,
    treesitter_context = true,
    telescope = { enabled = true },
    which_key = true,
    illuminate = { enabled = true },
    noice = true,
    notify = true,
    bufferline = true,
    trouble = true,
    snacks = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
      underlines = {
        errors      = { "underline" },
        hints       = { "underline" },
        warnings    = { "underline" },
        information = { "underline" },
      },
    },
  },
})

vim.cmd.colorscheme("catppuccin-mocha")
