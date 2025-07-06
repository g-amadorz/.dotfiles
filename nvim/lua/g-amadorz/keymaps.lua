-- My Grails
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "vv", "V")
vim.keymap.set("n", "ZZ", ":wq<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })
vim.keymap.set("n", "a", "i")
vim.keymap.set("n", "i", "a")
vim.keymap.set("n", "cc", "*yy")

-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Zen Mode
vim.keymap.set("n", "<leader>dz", ":ZenMode <CR>", { silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
