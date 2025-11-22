if vim.fn.executable('yaml-language-server') == 1 then
  vim.lsp.config('yamlls', {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml', 'yaml.docker-compose' },
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "docker-compose*.yml",
          ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
          ["https://json.schemastore.org/chart.json"] = "Chart.yaml"
        },
        validate = true,
        completion = true,
        hover = true
      }
    }
  })

  vim.lsp.enable('yamlls')
end

