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
	vim.keymap.set('n', '<C-s>', ':w<CR>')    -- Save
	vim.keymap.set('v', '<C-c>', '"+y')       -- Copy
	vim.keymap.set('n', '<C-v>', '"+P')       -- Paste normal mode
	vim.keymap.set('v', '<C-v>', '"+P')       -- Paste visual mode
	vim.keymap.set('c', '<C-v>', '<C-R>+')    -- Paste command mode
	vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '<C-R>+', { noremap = true, silent = true })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
