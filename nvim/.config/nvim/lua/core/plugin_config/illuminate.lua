require("illuminate").configure({
  under_cursor = false,
  large_file_cutoff = 5000,
  filetypes_denylist = {
    "DressingSelect",
    "Outline",
    "TelescopePrompt",
    "alpha",
    "toggleterm",
    "reason",
  },
})
