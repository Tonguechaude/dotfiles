local vim = vim
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require('nvim-tree.api')

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Highlight groups
vim.cmd([[
  :hi      NvimTreeExecFile    guifg=#ffa0a0
  :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
  :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
  :hi link NvimTreeImageFile   Title
]])

-- Global keymaps
vim.keymap.set('n', '<LEADER>n', ':NvimTreeToggle<CR>')

