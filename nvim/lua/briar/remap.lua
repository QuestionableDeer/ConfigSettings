vim.g.mapleader = ","

vim.keymap.set("n", "<leader>fb", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader><space>", ":noh<cr>")

-- keep half-page jumps in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep current search hit in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
