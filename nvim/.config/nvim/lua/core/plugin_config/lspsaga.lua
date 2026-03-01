require("lspsaga").setup({
  lightbulb = { virtual_text = false },
  symbol_in_winbar = { enable = false },
  implement = { enable = false },
})

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" })
vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "LSP finder" })
vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Preview definition" })
vim.keymap.set("n", "<leader>ls", "<cmd>Lspsaga signature_help<cr>", { desc = "Signature help" })
vim.keymap.set("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", { desc = "Workspace diagnostics" })
