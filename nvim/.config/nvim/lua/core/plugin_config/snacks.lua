require("snacks").setup({
  indent = {
    enabled = true,
    only_scope = true,
    animate = { enabled = false },
  },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  words = { enabled = true },
})

vim.keymap.set({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next reference" })
vim.keymap.set({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev reference" })
