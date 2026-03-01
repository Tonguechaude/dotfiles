local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Ouvrir/fermer dapui automatiquement
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- Signes
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DapLogPoint" })

-- Keymaps
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { silent = true, desc = "Breakpoint condition" })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<cr>", { silent = true, desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", ":DapContinue<cr>", { silent = true, desc = "Continue" })
vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { silent = true, desc = "Run to cursor" })
vim.keymap.set("n", "<leader>di", ":DapStepInto<cr>", { silent = true, desc = "Step into" })
vim.keymap.set("n", "<leader>do", ":DapStepOut<cr>", { silent = true, desc = "Step out" })
vim.keymap.set("n", "<leader>dO", ":DapStepOver<cr>", { silent = true, desc = "Step over" })
vim.keymap.set("n", "<leader>dr", ":DapToggleRepl<cr>", { silent = true, desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dt", ":DapTerminate<cr>", { silent = true, desc = "Terminate" })
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { silent = true, desc = "DAP UI toggle" })
vim.keymap.set({ "n", "v" }, "<leader>de", function() dapui.eval() end, { silent = true, desc = "DAP eval" })
vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { silent = true, desc = "DAP widgets" })
