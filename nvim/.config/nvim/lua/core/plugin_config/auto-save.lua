require("auto-save").setup({
  enabled = true,
  condition = function(buf)
    if vim.api.nvim_get_mode().mode == "i" then
      return false
    end
    local utils = require("auto-save.utils.data")
    if utils.not_in(vim.fn.getbufvar(buf, "&filetype"), { "TelescopePrompt" }) then
      return true
    end
    return false
  end,
})

vim.keymap.set("n", "<leader>ba", "<cmd>ASToggle<cr>", { desc = "Toggle auto-save" })
