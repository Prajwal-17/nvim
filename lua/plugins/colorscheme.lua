return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",

      -- dark background
      color_overrides = {
        mocha = {
          base = "#181818",
          mantle = "#1a1b1e",
          crust = "#0e0e0e",
        },
      },

      -- gruvbox syntax theme
      custom_highlights = function()
        return {
          Normal = { bg = "#181818", fg = "#e0cfa9" },
          Comment = { fg = "#70665c", style = { "italic" } },
          LineNr = { fg = "#55504a" },
          CursorLineNr = { fg = "#d4b97f", style = { "bold" } },
          SignColumn = { bg = "#181818" },

          Keyword = { fg = "#d38657", style = { "bold" } },
          Identifier = { fg = "#a9b665" },
          Function = { fg = "#e3c07b", style = { "bold" } },
          Statement = { fg = "#d65d5d" },
          Constant = { fg = "#b57690" },
          Type = { fg = "#8ec07c" },
          String = { fg = "#a9b665" },
          Number = { fg = "#d79921" },
          Boolean = { fg = "#d65d5d" },
          Operator = { fg = "#d38657" },
          Punctuation = { fg = "#a89984" },
          Variable = { fg = "#e0cfa9" },
          FunctionBuiltin = { fg = "#deb15d", style = { "italic" } },

          Visual = { bg = "#2a2522" },
          CursorLine = { bg = "#1d1d1d" },
          Search = { bg = "#3c3836", fg = "#d4b97f" },
        }
      end,

      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
