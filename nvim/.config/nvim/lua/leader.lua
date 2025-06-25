local vim = vim

-- LEADER SHORTCUTS
vim.g.mapleader = " "
-- Quit
vim.keymap.set('n', '<LEADER>q', ':bw<CR>')
-- Select everything
vim.keymap.set('n', '<LEADER>v', 'V`]')
-- Clear search highlight
vim.keymap.set('n', '<LEADER>,', ':noh<CR>')
-- Save current buffer
vim.keymap.set('n', '<LEADER>w', ':w<CR>')
-- Alternate between two buffers
vim.keymap.set('n', '<LEADER>a', ':b#<CR>')
-- The one, and only
vim.keymap.set('n', '<LEADER>f', ':FZF<CR>')

-- Keep default register when pasting (send erased selection in black hole
-- register)
vim.keymap.set('v', '<LEADER>p', '"_dP')

-- Move around windows
vim.keymap.set('n', '<LEADER>h', '<C-w>h')
vim.keymap.set('n', '<LEADER><Left>', '<C-w>h')
vim.keymap.set('n', '<LEADER>j', '<C-w>j')
vim.keymap.set('n', '<LEADER><Down>', '<C-w>j')
vim.keymap.set('n', '<LEADER>k', '<C-w>k')
vim.keymap.set('n', '<LEADER><Up>', '<C-w>k')
vim.keymap.set('n', '<LEADER>l', '<C-w>l')
vim.keymap.set('n', '<LEADER><Right>', '<C-w>l')
