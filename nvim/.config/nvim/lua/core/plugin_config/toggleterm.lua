require("toggleterm").setup({
  size = 15,
  open_mapping = [[<A-i>]],
  direction = "horizontal",
  float_opts = {
    border = "rounded",
    width = 80,
    height = 20,
  },
  winbar = { enabled = true },
})
