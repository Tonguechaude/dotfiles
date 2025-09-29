local vim = vim

-- Dependency for Hardtime: vim.notify needs to be setup
vim.notify = require("notify")

-- Break bad habits, master Vim motions
-- See plugins lua
require("hardtime").setup({
  -- I keep arrow keys and HJKL because I'm addict
  disabled_keys = {
    ["<Up>"] = {},
    ["<Down>"] = {},
    ["<Left>"] = {},
    ["<Right>"] = {},
  },

  restricted_keys = {
    ["h"] = {},
    ["j"] = {},
    ["k"] = {},
    ["l"] = {},
  }
})
vim.opt.termguicolors = true
