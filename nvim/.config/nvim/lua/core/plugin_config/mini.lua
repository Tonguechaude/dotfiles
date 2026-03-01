local mini = require("mini")

require("mini.map").setup()
require("mini.bracketed").setup()
require("mini.diff").setup()
require("mini.jump").setup()
require("mini.operators").setup({
  exchange = { prefix = "gX" },
})

vim.keymap.set("n", "mt", function() MiniMap.toggle() end, { desc = "Toggle minimap" })
vim.keymap.set("n", "<leader>gD", function() MiniDiff.toggle_overlay() end, { desc = "Toggle inline diff" })
