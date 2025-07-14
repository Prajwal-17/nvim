vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- ctrl + backspace
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<NOP>", { noremap = true, silent = true }) -- NOP => no operation
vim.keymap.set("c", "<C-h>", "<NOP>", { noremap = true, silent = true })

-- preserves the yanked text even after pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
