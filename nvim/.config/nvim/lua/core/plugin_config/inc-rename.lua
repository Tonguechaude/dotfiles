require("inc_rename").setup()

vim.keymap.set("n", "<leader>cr", ":IncRename ", { desc = "Rename (inc-rename)" })
