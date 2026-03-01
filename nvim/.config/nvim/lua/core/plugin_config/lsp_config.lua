require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "ruff",
    "ts_ls",
    "typos_lsp",
    "yamlls",
    "zls",
    -- puppet-editor-services est géré manuellement ci-dessous
  },
  handlers = {
    function(server_name)
      if server_name == "rust_analyzer" then return end
      vim.lsp.enable(server_name)
    end,
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("typos_lsp", {
  init_options = {
    diagnosticSeverity = "Hint",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
      vim.api.nvim_command("hi clear Error")
    end, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
    vim.keymap.set("n", "gl", require("telescope.builtin").diagnostics, opts)
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ga", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Configuration Puppet LSP
vim.lsp.config.puppet = {
  cmd = {
    "puppet-languageserver",
    "--stdio",
    "--puppet-settings=--moduledir,./spec/fixtures/modules",
  },
  filetypes = { "puppet" },
  root_markers = { ".git", "manifests", "metadata.json" },
  settings = {
    puppet = {
      validate = true,
      lint = {
        no_80chars_check = false,
        no_documentation_check = false,
      },
    },
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "puppet",
  callback = function()
    vim.lsp.enable("puppet")
  end,
})
