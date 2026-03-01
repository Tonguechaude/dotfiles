require("persistence").setup()

vim.keymap.set("n", "<leader>ss", function() require("persistence").load() end, { silent = true, desc = "Restore session" })
vim.keymap.set("n", "<leader>sl", function() require("persistence").load({ last = true }) end, { silent = true, desc = "Restore last session" })
vim.keymap.set("n", "<leader>sd", function() require("persistence").stop() end, { silent = true, desc = "Don't save session" })
