local map = vim.api.nvim_set_keymap

vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.cmd("set mouse=a")
vim.g.mapleader = " "

-- Only in neovide, the below keymaps work
if vim.g.neovide then
	vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<C-c>", '"+y') -- Copy
	vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
map("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
map("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
map("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
map("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })

-- Navigate vim panes better
map("n", "<c-k>", ":wincmd k<CR>", { noremap = true, silent = false })
map("n", "<c-j>", ":wincmd j<CR>", { noremap = true, silent = false })
map("n", "<c-h>", ":wincmd h<CR>", { noremap = true, silent = false })
map("n", "<c-l>", ":wincmd l<CR>", { noremap = true, silent = false })

-- set shortcut for Neotree
map("n", "<C-n>", ":Neotree reveal <CR>", {})
map("n", "<C-g>", ":Neotree toggle git_status <CR>", {})

-- set shortcut for LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- set shortcut for format code
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
