if vim.fn.executable('clangd-20') == 1 then
  vim.lsp.config('clangd', {
    cmd = { 'clangd-20' },
    filetypes = { 'c', 'h', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    settings = {
      clangd = {
        arguments = {
          '--header-insertion=iwyu',
          '--clang-tidy',
          '--completion-style=detailed'
        }
      }
    }
  })

  vim.lsp.enable('clangd')
end

