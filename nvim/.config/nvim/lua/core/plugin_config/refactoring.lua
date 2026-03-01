require("refactoring").setup()
require("telescope").load_extension("refactoring")

vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = "Refactoring picker" })
