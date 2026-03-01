-- rustaceanvim se configure via vim.g.rustaceanvim AVANT que le plugin charge
-- Il remplace rust_analyzer dans mason-lspconfig
vim.g.rustaceanvim = {
  tools = {
    enable_clippy = false,
  },
}
