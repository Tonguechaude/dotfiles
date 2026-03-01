require("todo-comments").setup()

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { silent = true, desc = "Find TODOs" })
