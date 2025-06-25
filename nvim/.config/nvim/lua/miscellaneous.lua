local vim = vim

-- Give more space for displaying messages.
vim.g.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.g.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess = 'c'

-- Activate FZF
vim.g.runtimepath = { '~/.fzf' }

-- Security concerns and useless anyway
vim.g.modelines = 0

-- Markdown support
-- Treat *.md files as markdown syntax (default is modula2)
vim.g.markdown_fenced_languages = { 'html', 'javascript', 'bash=sh' }

-- Remove wrapping for markdown (markdown interperters do it automatically for
-- display anyway
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*markdown*",
    callback = function() vim.b.tw = "0" end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
    pattern = "*.dockerfile",
    callback = function() vim.opt.filetype = "dockerfile" end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
    pattern = "*.bashrc",
    callback = function() vim.opt.filetype = "sh" end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
    pattern = "*.env*",
    callback = function() vim.opt.filetype = "sh" end
})

-- Tab movement
vim.keymap.set('n', '<F2>', ':tabp<CR>')
vim.keymap.set('n', '<F3>', ':tabn<CR>')

-- Indent setup
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- File search
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
vim.opt.wildignore:append({ "node_modules/*" })

-- Misc
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 3
vim.opt.autoindent = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.visualbell = true
-- vim.opt.cursorline
vim.opt.ttyfast = true
vim.opt.ruler = true
vim.opt.backspace = { "indent", "eol", "start" }

-- Display line number relative to the current one
vim.opt.relativenumber = true

-- Undo info available across vim instances
vim.opt.undofile = true

-- Sane search
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('v', '/', '/\\v')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

-- Long lines handling
vim.opt.wrap = true
vim.opt.textwidth = 0
vim.opt.formatoptions = "qrn1"
vim.opt.colorcolumn = "85"

-- Colorscheme
vim.opt.background = "dark" -- or light if you want light mode

-- Display trailing spaces and other stuff
vim.opt.listchars = "tab:  ,trail:~,extends:>,precedes:<,nbsp:⎵"
vim.opt.list = true

vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand('~') .. "/.vim/backup"
vim.opt.directory = vim.fn.expand('~') .. "/.vim/swap"
vim.opt.undodir = vim.fn.expand('~') .. "/.vim/undo"
vim.opt.writebackup = true
vim.opt.backupcopy = "yes"

-- Activate autoswap tmux feature so that opening an already open file will
-- automatically switch to the already opened vim instance in the relevant
-- tmux window/panel
vim.g.titlestring = ""
vim.g.autoswap_detect_tmux = 1

-- Automatically refresh buffer on external changes
vim.opt.autoread = true
-- Wait x milliseconds of inactivity to write the current buffer into a swap
-- file, and to trigger CursorHold a event.
vim.opt.updatetime = 2000

-- Default the unnamed (default) register to the '+' one which is the default
-- X one. Other systems (Windows for sure) should not care if it's '+' or '*'
-- anyway.
-- But for this to work you might need vim-gtk or vim-gnome installed
-- (see http://vim.wikia.com/wiki/Accessing_the_system_clipboard for more info)
-- Windows WSL user should look into this link for cross-clipboard handling:
-- https://github.com/Microsoft/WSL/issues/892#issuecomment-275873108
vim.opt.clipboard = "unnamedplus"


-- Easymotion configuration
vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings
-- Jump to anywhere you want with minimal keystrokes, with just one key binding.
-- `s{char}{label}`
-- nmap s <Plug>(easymotion-overwin-f)
-- or
-- `s{char}{char}{label}`
-- Need one more keystroke, but on average, it may be more comfortable.
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f2)')
-- Turn on case insensitive feature
vim.g.EasyMotion_smartcase = 1

-- ripgrep support
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Nvim only: create a dynamic split to view RegEx in real time
vim.opt.inccommand = "nosplit"

-- vim-emmet configuration
vim.g.user_emmet_leader_key = '<Tab>'

-- Explain Rust errors
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "rust",
    callback = function() vim.keymap.set('n', '<LEADER>e', ":call CocCommand('rust-analyzer.explainError')<CR>") end
})

vim.cmd("iabbrev imgr img.r-stretch<TAB>,")

-- Show Indentation visual guides by default (vim-indent-guides plugin)
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_default_mapping = 0
