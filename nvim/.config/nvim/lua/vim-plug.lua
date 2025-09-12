local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Typescript syntax
Plug('leafgarland/typescript-vim')
-- jsx/tsx syntax
Plug('peitalin/vim-jsx-typescript')

-- Git Integration
Plug('tpope/vim-fugitive')
-- Fugitive Github plugin
Plug('tpope/vim-rhubarb')

-- Advanced Vim Targets (/!\ Will override some basic ones)
Plug('wellle/targets.vim')

-- Vim Session handling
Plug('tpope/vim-obsession')

-- nvim-tree (modern file explorer)
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('scrooloose/nerdcommenter')

-- .editorconfig support
Plug('editorconfig/editorconfig-vim')

-- Indent guide
Plug('preservim/vim-indent-guides')

-- Region Expansion
Plug('terryma/vim-expand-region')

-- Surrounding plugin (to add quotes/parens/brackets around stuff)
Plug('tpope/vim-surround')

-- Best status bar ever
Plug('vim-airline/vim-airline')

-- Conquer of Completion and LSP support
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Go
-- Plug('fatih/vim-go')

-- Better substitution: use S instead of s and never look back !
Plug('tpope/vim-abolish')

-- Easy motion
Plug('easymotion/vim-easymotion')

-- Code formatting
Plug('sbdchd/neoformat')

-- Javascript syntax highlighting
Plug('pangloss/vim-javascript')
Plug('othree/jsdoc-syntax.vim')

-- PlantUML support
Plug('aklt/plantuml-syntax')
vim.g.plantuml_set_makeprg = 0

-- Easy HTML writing
Plug('mattn/emmet-vim')

-- the best cursor
Plug('sphamba/smear-cursor.nvim')

-- Theme
-- Plug('ellisonleao/gruvbox.nvim')
Plug('everviolet/nvim', { ['as'] = 'evergarden' })

-- Notify for my vim routine
Plug('MunifTanjim/nui.nvim')
Plug('m4xshen/hardtime.nvim')
Plug('rcarriga/nvim-notify')

-- cool icon for my vim setup
Plug('lewis6991/impatient.nvim')
Plug('goolord/alpha-nvim')

-- Puppet
Plug('rodjek/vim-puppet')

-- Ruby
Plug('vim-ruby/vim-ruby')

-- fzf <3 vim
Plug('ibhagwan/fzf-lua')

vim.call('plug#end')

require('smear_cursor').enabled = true

