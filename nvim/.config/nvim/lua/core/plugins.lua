local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- ─── Dependencies ───────────────────────────────────────────────────
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  'rcarriga/nvim-notify',

  -- ─── Colorschemes ───────────────────────────────────────────────────
  'ellisonleao/gruvbox.nvim',
  'rose-pine/neovim',
  'tomasiser/vim-code-dark',
  'folke/tokyonight.nvim',
  'rebelot/kanagawa.nvim',
  'Mofiqul/vscode.nvim',
  'catppuccin/nvim',

  -- ─── UI ─────────────────────────────────────────────────────────────
  {
    'folke/noice.nvim',
    event = "VeryLazy",
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  'famiu/bufdelete.nvim',
  'nvim-lualine/lualine.nvim',
  'RRethy/vim-illuminate',
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
  },

  -- ─── Navigation ─────────────────────────────────────────────────────
  {
    'folke/flash.nvim',
    event = "VeryLazy",
  },
  'numToStr/Navigator.nvim',
  {
    'mikavilpas/yazi.nvim',
    event = "VeryLazy",
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  { 'ahmedkhalf/project.nvim' },
  {
    'cbochs/grapple.nvim',
    opts = { scope = "git" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
      { "<leader>M", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
      { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
  },

  -- ─── Editing ────────────────────────────────────────────────────────
  'kylechui/nvim-surround',
  'windwp/nvim-autopairs',
  'numToStr/Comment.nvim',
  'tpope/vim-sleuth',
  'ethanholz/nvim-lastplace',
  'norcalli/nvim-colorizer.lua',
  'mbbill/undotree',
  { 'akinsho/toggleterm.nvim', version = "*" },
  { 'echasnovski/mini.nvim', version = false },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
  },
  -- grug-far : à réactiver avec le bon repo GitHub (chercher "grug-far.nvim" sur GitHub)
  -- { 'AUTHOR/grug-far.nvim', cmd = "GrugFar" },

  -- ─── Treesitter ─────────────────────────────────────────────────────
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'windwp/nvim-ts-autotag',
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- ─── LSP ────────────────────────────────────────────────────────────
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  'nvimdev/lspsaga.nvim',
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
  'smjonas/inc-rename.nvim',
  'stevearc/conform.nvim',
  'ThePrimeagen/refactoring.nvim',
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },

  -- ─── Completion ─────────────────────────────────────────────────────
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "super-tab" },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        ghost_text = { enabled = true },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- ─── Git ────────────────────────────────────────────────────────────
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',
  'pwntester/octo.nvim',

  -- ─── Diagnostics ────────────────────────────────────────────────────
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- ─── Debug ──────────────────────────────────────────────────────────
  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  },
  'theHamsta/nvim-dap-virtual-text',

  -- ─── Test ───────────────────────────────────────────────────────────
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/nvim-nio',
    },
  },

  -- ─── Session ────────────────────────────────────────────────────────
  { 'folke/persistence.nvim', event = "BufReadPre" },
  { 'okuuva/auto-save.nvim' },

  -- ─── Markdown / Docs ────────────────────────────────────────────────
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable "npx" then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
    end,
  },
  'jakewvincent/mkdnflow.nvim',
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  },

  -- ─── LaTeX ──────────────────────────────────────────────────────────
  { "lervag/vimtex", lazy = false },

  -- ─── Symbols / Breadcrumbs ───────────────────────────────────────────
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },

  -- ─── Clipboard ──────────────────────────────────────────────────────
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  -- ─── Images ─────────────────────────────────────────────────────────
  {
    'vhyrro/luarocks.nvim',
    priority = 1001,
    opts = { rocks = { "magick" } },
  },
  {
    '3rd/image.nvim',
    dependencies = { 'luarocks.nvim' },
    config = function()
      require("image").setup({
        backend = "kitty",
        max_height_window_percentage = 50,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
      })
    end,
  },

  -- ─── Utilities ──────────────────────────────────────────────────────
  'lambdalisue/suda.vim',

  -- ─── Extras ─────────────────────────────────────────────────────────
  'wakatime/vim-wakatime',
  'andweeb/presence.nvim',
}

local opts = {
  ui = {
    border = "rounded",
  },
}

require("lazy").setup(plugins, opts)
