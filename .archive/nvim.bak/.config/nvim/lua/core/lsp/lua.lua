vim.lsp.config('lua_ls', {
  cmd = { '/opt/lua_ls/bin/lua-language-server' },
})

vim.lsp.enable('lua_ls')
