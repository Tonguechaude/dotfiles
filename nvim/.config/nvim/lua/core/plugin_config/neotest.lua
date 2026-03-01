require("neotest").setup({
  adapters = {},
})

local nt = require("neotest")

vim.keymap.set("n", "<leader>tt", function() nt.run.run(vim.fn.expand("%")) end, { silent = true, desc = "Run file tests" })
vim.keymap.set("n", "<leader>tT", function() nt.run.run(vim.loop.cwd()) end, { silent = true, desc = "Run all tests" })
vim.keymap.set("n", "<leader>tr", function() nt.run.run() end, { silent = true, desc = "Run nearest test" })
vim.keymap.set("n", "<leader>td", function() nt.run.run({ strategy = "dap" }) end, { silent = true, desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>ts", function() nt.summary.toggle() end, { silent = true, desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", function() nt.output.open({ enter = true, auto_close = true }) end, { silent = true, desc = "Show test output" })
vim.keymap.set("n", "<leader>tO", "<cmd>Neotest output-panel toggle<cr>", { silent = true, desc = "Toggle output panel" })
vim.keymap.set("n", "<leader>tS", function() nt.run.stop() end, { silent = true, desc = "Stop tests" })
