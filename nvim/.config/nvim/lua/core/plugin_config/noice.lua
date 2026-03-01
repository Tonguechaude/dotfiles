require("noice").setup({
  presets = {
    inc_rename = true,
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
})

require("notify").setup({
  timeout = 1000,
  render = "minimal",
  background_colour = "#000000",
})
