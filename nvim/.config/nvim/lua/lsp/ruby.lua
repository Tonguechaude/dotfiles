if vim.fn.executable('solargraph') == 1 then
  vim.lsp.config('solargraph', {
    cmd = { 'solargraph', 'stdio' },
    filetypes = { 'ruby' },
    settings = {
      solargraph = {
        diagnostics = true,
        completion = true,
        hover = true,
        formatting = true,
        symbols = true,
        definitions = true,
        rename = true,
        references = true
      }
    }
  })

  vim.lsp.enable('solargraph')
end

