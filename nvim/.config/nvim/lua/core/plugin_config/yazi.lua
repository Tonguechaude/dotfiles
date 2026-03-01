require("yazi").setup({
  open_for_directories = true,
  use_ya_for_events_reading = true,
  use_yazi_client_id_flag = true,
})

vim.keymap.set("n", "<leader>o", "<cmd>Yazi<cr>", { desc = "Open yazi (parent directory)" })
vim.keymap.set("n", "<leader><C-o>", "<cmd>Yazi cwd<cr>", { desc = "Open yazi (cwd)" })
vim.keymap.set("n", "<leader>O", "<cmd>Yazi toggle<cr>", { desc = "Resume last yazi session" })
