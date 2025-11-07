return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          mappings = {
            i = { -- 'i' stands for 'insert mode' (when you're typing in the search bar)
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,

              -- *** THIS IS THE NEW AND CORRECTED LINE FOR CTRL + BACKSPACE ***
              -- Instead of calling a non-existent Telescope action,
              -- we directly tell Neovim to perform its standard "delete word backward" action (<C-w>).
              ["<C-BS>"] = function(prompt_bufnr)
                vim.api.nvim_input("<C-w>") -- This tells Neovim to input Ctrl+W
              end,
            },
            -- This 'n' (normal mode) section is good, uncomment if you want to use j/k
            -- to navigate AFTER you stop typing in the search bar:
            n = {
              ["j"] = require("telescope.actions").move_selection_next,
              ["k"] = require("telescope.actions").move_selection_previous,
              ["<CR>"] = require("telescope.actions").select_default, -- Enter key to select
              ["q"] = require("telescope.actions").close, -- 'q' to quit Telescope
            },
          },
          -- These are correctly placed outside the 'mappings' table
          path_display = { "smart" },
          file_ignore_patterns = { "node_modules", "dist/", "build/" },
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      vim.api.nvim_create_autocmd("User", {
        pattern = "TelescopePreviewerLoaded",
        callback = function()
          vim.wo.wrap = true
        end,
      })
      -- keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
}
