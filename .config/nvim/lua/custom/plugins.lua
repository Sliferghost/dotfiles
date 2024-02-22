local plugins = {
  {
    -- Plugin to manage dependencies
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Web
        "prettier",
        "eslint-lsp",
        "css-lsp",
        "astro-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "prisma-language-server",

        -- LUA
        "lua-language-server",
        "stylua",
      },
    },
  },
  {
    -- Plugin to manage language servers (required to enable auto-complete, formatting, linting)
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- Plugin to manage formatting & linting
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    -- Plugin to auto-close tags
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    -- Plugin to manage syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "vim",
        "lua",
        "toml",
        "yaml",
        "xml",
        "regex",

        -- Web
        "css",
        "html",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",

        -- Web Frameworks
        "astro",
        "prisma",

        -- Dev. workflow
        "gitignore",
      },
    },
  },
  -- {
  --   -- Plugin to create suggestions based on AI
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "InsertEnter",
  --   config = function()
  --     require "custom.configs.copilot"
  --   end,
  -- },
  {
    -- Plugin to display suggestions and snippets
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
  {
    -- Plugin to make navigation between tmux and neovim a lot simpler
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
  },
}
return plugins
