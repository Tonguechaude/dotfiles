require("conform").setup({
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
  formatters_by_ft = {
    html       = { "prettierd" },
    css        = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    markdown   = { "prettierd" },
    python     = { "black" },
    lua        = { "stylua" },
  },
  notify_on_error = true,
})

vim.keymap.set("n", "<leader>cf", function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  if not vim.b.disable_autoformat then require("conform").format() end
end, { silent = true, desc = "Toggle autoformat (buffer)" })

vim.keymap.set("n", "<leader>cF", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  if not vim.g.disable_autoformat then require("conform").format() end
end, { silent = true, desc = "Toggle autoformat (global)" })
