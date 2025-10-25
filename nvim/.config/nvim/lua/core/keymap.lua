local vim = vim

-- LEADER SHORTCUTS
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
vim.keymap.set('n', '<LEADER>f', ':FzfLua files<CR>')
-- Source file
vim.keymap.set('n', '<LEADER>o', ':update<CR> :source<CR>')

vim.keymap.set({'n', 'v', 'x'}, '<LEADER>y', '"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<LEADER>d', '"+y<CR>')

-- Keep default register when pasting (send erased selection in black hole
-- register)
vim.keymap.set('v', '<LEADER>p', '"_dP')

-- Move around windows
vim.keymap.set('n', '<LEADER>h', '<C-w>h')
vim.keymap.set('n', '<LEADER>j', '<C-w>j')
vim.keymap.set('n', '<LEADER>k', '<C-w>k')
vim.keymap.set('n', '<LEADER>l', '<C-w>l')

--vim.keymap.set('i', 'kj', '<Esc>', {desc = "Use 'kj' keys in quick succession for Esc" })

-- Move lines up or down when in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep window centered when going up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("cd %:p:h")
  vim.cmd("belowright split | terminal")
  vim.cmd("startinsert")
end, { desc = "start a terminal in folder of current file"})

vim.keymap.set("v", "<C-r>", "\"hy:%s<C-r>h//gc<left><left><left>")

-- Git
vim.keymap.set("n", "<leader>gg", "<CMD>G<CR>", { desc = "Show git status list in buffer" })
vim.keymap.set("n", "<leader>gri", function()
  local rebase_branch = vim.fn.input("Enter branch to rebase on: ")
  vim.cmd("Git rebase -i " .. rebase_branch)
end, { desc = "Run git rebase interactive. You will be prompted for the branch to rebase onto." })
vim.keymap.set("n", "<leader>gra", "<CMD>G rebase --abort<CR>", { desc = "Abort the git rebase" })
vim.keymap.set("n", "<leader>grc", "<CMD>G rebase --continue<CR>", { desc = "Continue the git rebase" })
vim.keymap.set("n", "<leader>gps", "<CMD>G push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gpf", "<CMD>G push --force<CR>", { desc = "Git force push" })
vim.keymap.set("n", "<leader>gc", "<CMD>G commit -s<CR>", { desc = "Git signed commit" })
