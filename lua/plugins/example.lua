return {
  -- 1. load lazyvim core plugins first (must be first!)
  { import = "lazyvim.plugins" },

  -- 2. lazyvim extras
  --{ import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- 3. your custom plugins

  -- enable emoji completion in nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "LazyFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  -- customize telescope layout and add plugin file keymap
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "find plugin file",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  -- setup pyright (python lsp)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false }, -- ✅ disables `: void`
                enumMemberValues = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false }, -- ✅ disables `: void`
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
      },
    },
  },

  -- setup tsserver with typescript.nvim
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "typescriptorganizeimports", {
            buffer = buffer,
            desc = "organize imports",
          })
          vim.keymap.set("n", "<leader>cr", "typescriptrenamefile", {
            buffer = buffer,
            desc = "rename file",
          })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- extend treesitter language support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- add development tools via mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "prettier",
      },
    },
  },

  -- a formater plugin built-in with lazyvim, autoformat on save like vscode
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
