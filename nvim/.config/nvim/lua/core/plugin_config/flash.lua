local flash = require("flash")

flash.setup({
  modes = {
    char = { enabled = false },
  },
})

vim.keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "<leader>S", function() flash.treesitter() end, { desc = "Flash treesitter" })
vim.keymap.set("o", "<leader>r", function() flash.remote() end, { desc = "Flash remote" })
vim.keymap.set({ "x", "o" }, "<leader>R", function() flash.treesitter_search() end, { desc = "Flash treesitter search" })
vim.keymap.set("c", "<C-s>", function() flash.toggle() end, { desc = "Flash toggle" })
