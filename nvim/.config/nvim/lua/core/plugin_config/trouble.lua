require("trouble").setup({
  auto_close = true,
})

vim.keymap.set("n", "<leader>xq", "<cmd>TodoTrouble toggle<cr>", { silent = true, desc = "Todo (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>TodoQuickFix<cr>", { silent = true, desc = "Quickfix list (Trouble)" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP refs/defs (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list (Trouble)" })
