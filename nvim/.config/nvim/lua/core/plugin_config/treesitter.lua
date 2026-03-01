require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "css",
    "devicetree",
    "html",
    "java",
    "javascript",
    "json",
    "kconfig",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "query",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "zig",
    "puppet",
  },

  modules = {},
  sync_install = false,
  auto_install = true,
  ignore_install = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "diff" },
  },

  indent = { enable = true },

  incremental_selection = { enable = true },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["at"] = "@comment.outer",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.outer",
      },
    },
  },
})

-- Extension de type de fichier
vim.filetype.add({
  extension = {
    overlay = "devicetree",
  },
})

-- ts-autotag
require("nvim-ts-autotag").setup()

-- ts-context-commentstring
require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
