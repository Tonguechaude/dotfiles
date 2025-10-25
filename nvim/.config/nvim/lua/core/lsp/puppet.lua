if vim.fn.executable('puppet-editor-service') == 1 then
  vim.lsp.config('puppet', {
    cmd = { '/opt/puppet-editor-services/bin/puppet-languageserver', '--stdio' },
    filetypes = { 'puppet' },
    settings = {
      puppet = {
        validate = {
          enable = true
        },
        lint = {
          enable = true
        },
        format = {
          enable = true
        }
      }
    }
  })

  vim.lsp.enable('puppet')
end
