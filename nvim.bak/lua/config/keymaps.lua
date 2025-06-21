-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Switching to normal mode is now  "jj"
vim.keymap.set("i", "jj", "<Esc>")

-- Move Highlights
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Page Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-Tab>", "<C-u>zz")
