require("which-key").setup()

require("which-key").add({
  { "<leader>f",  group = "+find" },
  { "<leader>s",  group = "+session" },
  { "<leader>g",  group = "+git" },
  { "<leader>gh", group = "+hunk" },
  { "<leader>l",  group = "+lsp" },
  { "<leader>x",  group = "+diagnostics" },
  { "<leader>w",  group = "+windows" },
  { "<leader>b",  group = "+buffer" },
  { "<leader>d",  group = "+debug" },
  { "<leader>c",  group = "+code" },
  { "<leader>t",  group = "+test" },
})
