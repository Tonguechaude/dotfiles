local vim = vim

-- NERDTree config

-- Toggle NERDTree panel
vim.keymap.set('n', '<LEADER>n', ':NERDTreeToggle<CR>')

-- Change directory to highlighted directory
vim.keymap.set('n', '<LEADER>N :execute \'cd %:h\' <bar>', 'NERDTree<CR>')

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDSpaceDelims = 1
