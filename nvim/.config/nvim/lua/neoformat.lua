local vim = vim

-- Default formatting = vim native indentation
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    callback = function() vim.keymap.set('n', '<LEADER>b', 'ggVG=<CR>') end
})

-- Don't forget to install prettier globally (npm install -g prettier)
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "javascript",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "javascript",
    callback = function() vim.b.formatprg = 'prettier --parser typescript --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "json",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "json",
    callback = function() vim.b.formatprg = 'prettier --parser json --stdin-filepath @%n' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "typescript*",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "typescript*",
    callback = function() vim.b.formatprg = 'prettier --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "html",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
-- vim.api.nvim_create_autocmd({"FileType"}, {
-- pattern = "html",
-- callback = function () vim.b.formatprg='npx html-beautify -A 'force-aligned' -n' end
-- })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "html",
    callback = function() vim.b.formatprg = 'prettier --parser html --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "svg",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "svg",
    callback = function() vim.b.formatprg = 'prettier --parser html --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "css",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "css",
    callback = function() vim.b.formatprg = 'prettier --parser css --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "scss",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "scss",
    callback = function() vim.b.formatprg = 'prettier --parser css --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "go",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':GoFmt<CR>') end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "yaml,yml",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "yaml,yml",
    callback = function() vim.b.formatprg = 'prettier --parser yaml --stdin-filepath @%' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "terraform",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':TerraformFmt<CR>') end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "rust",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "rust",
    callback = function() vim.b.formatprg = 'rustfmt --edition 2021' end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "python",
    callback = function() vim.keymap.set('n', '<LEADER>b', ':Neoformat<CR>') end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "python",
    callback = function() vim.b.formatprg = 'black @%' end
})


vim.g.neoformat_try_formatprg = 1
vim.g.neoformat_enabled_typescript = { 'prettier' }
vim.g.neoformat_enabled_typescriptreact = { 'prettier' }
