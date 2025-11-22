vim.pack.add({
  -- Typescript syntax
  {src = "https://github.com/leafgarland/typescript-vim"},

  -- jsx/tsx syntax
  {src = "https://github.com/peitalin/vim-jsx-typescript"},

  -- Git Integration
  {src = "https://github.com/tpope/vim-fugitive"},
  {src = "https://github.com/lewis6991/gitsigns.nvim.git"},

  -- Fugitive Github plugin
  {src = "https://github.com/tpope/vim-rhubarb"},

  -- Advanced Vim Targets (/!\ Will override some basic ones)
  {src = "https://github.com/wellle/targets.vim"},

  -- Vim Session handling
  {src = "https://github.com/tpope/vim-obsession"},

  -- nvim-tree (modern file explorer)
  {src = "https://github.com/nvim-tree/nvim-tree.lua"},
  {src = "https://github.com/nvim-tree/nvim-web-devicons"},
  {src = "https://github.com/scrooloose/nerdcommenter"},

  -- .editorconfig support
  {src = "https://github.com/editorconfig/editorconfig-vim"},

  -- Indent guide
  {src = "https://github.com/preservim/vim-indent-guides"},

  -- Region Expansion
  {src = "https://github.com/terryma/vim-expand-region"},

  -- Surrounding plugin (to add quotes/parens/brackets around stuff)
  {src = "https://github.com/tpope/vim-surround"},

  -- Best status bar ever
  {src = "https://github.com/vim-airline/vim-airline"},

  -- LSP Plugin
  { src = 'https://github.com/neovim/nvim-lspconfig' },

  -- Go
  {src = "https://github.com/fatih/vim-go"},

  -- JDTLS
  {src = "https://github.com/mfussenegger/nvim-jdtls"},

  -- Better substitution: use S instead of s and never look back !
  {src = "https://github.com/tpope/vim-abolish"},

  -- Easy motion
  {src = "https://github.com/easymotion/vim-easymotion"},

  -- Code formatting
  {src = "https://github.com/sbdchd/neoformat"},

  -- Javascript syntax highlighting
  {src = "https://github.com/pangloss/vim-javascript"},
  {src = "https://github.com/othree/jsdoc-syntax.vim"},

  -- PlantUML support
  {src = "https://github.com/aklt/plantuml-syntax"},

  -- Easy HTML writing
  {src = "https://github.com/mattn/emmet-vim"},

  -- Theme
  -- {src = "https://github.com/ellisonleao/gruvbox.nvim"},
  {src = "https://github.com/everviolet/nvim",
    name = 'evergarden' },

  -- Notify for my vim routine
  {src = "https://github.com/MunifTanjim/nui.nvim"},
  {src = "https://github.com/m4xshen/hardtime.nvim"},
  {src = "https://github.com/rcarriga/nvim-notify"},

  -- cool icon for my vim setup
  {src = "https://github.com/lewis6991/impatient.nvim"},
  {src = "https://github.com/goolord/alpha-nvim"},

  -- Puppet
  {src = "https://github.com/rodjek/vim-puppet"},

  -- Ruby
  {src = "https://github.com/vim-ruby/vim-ruby"},

  -- fzf <3 vim
  {src = "https://github.com/ibhagwan/fzf-lua"},

  -- tree-sitter go crazy
  {src = "https://github.com/nvim-treesitter/nvim-treesitter"},

  {src = "https://github.com/nvim-treesitter/nvim-treesitter-context"},
})

-- PlantUML support
vim.g.plantuml_set_makeprg = 0

