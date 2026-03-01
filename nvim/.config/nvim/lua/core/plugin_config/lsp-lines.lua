require("lsp_lines").setup()

-- Désactivé par défaut, activer avec <leader>ll
vim.diagnostic.config({ virtual_lines = false })

vim.keymap.set("n", "<leader>ll", function()
  local config = vim.diagnostic.config()
  vim.diagnostic.config({ virtual_lines = not config.virtual_lines })
end, { desc = "Toggle lsp-lines" })
