local map = vim.keymap.set
local cmd = vim.cmd
local opts = { noremap = true, silent = true }

cmd("set number") -- set line number
cmd("set relativenumber") -- set relative line number
cmd("set autoindent")
cmd("set tabstop=4")
cmd("set shiftwidth=4")
cmd("set smarttab")
cmd("set softtabstop=4")
cmd("set mouse=a") -- allow mouse action
cmd("set mousemoveevent") -- set mouse move detection for bufferline hover show close icon
vim.g.mapleader = " " -- set space as leader key

-- KeyBind
-- Only in neovide, the below keymaps work
-- require neovide
if vim.g.neovide then
	map("v", "<C-c>", '"+y') -- Copy
	map("n", "<C-v>", '"+P') -- Paste normal mode
	map("v", "<C-v>", '"+P') -- Paste visual mode
	map("c", "<C-v>", "<C-R>+") -- Paste command mode
	map("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
map("", "<C-v>", "+p<CR>", opts)
map("!", "<C-v>", "<C-R>+", opts)
map("t", "<C-v>", "<C-R>+", opts)
map("v", "<C-v>", "<C-R>+", opts)

-- cancel hightlight search result for /
map("n", "<leader>n", ":noh <CR>", opts)

-- set keybind of folds


-- set KeyBind for BufferLine
-- set to go a specific buffer
map("n", "<leader>b", ":BufferLinePick <CR>", opts)
-- set to close a specific buffer
map("n", "<leader>cb", ":BufferLinePickClose <CR>", opts)
-- set to close other buffers
map("n", "<leader>co", ":BufferLineCloseOthers <CR>", opts)

-- set choose buffer by cycle next
map("n", "<c-tab>", ":BufferLineCycleNext <CR>", opts)

-- set choose buffer by number
map("n", "<c-1>", ":BufferLineGoToBuffer 1 <CR>", opts)
map("n", "<c-2>", ":BufferLineGoToBuffer 2 <CR>", opts)
map("n", "<c-3>", ":BufferLineGoToBuffer 3 <CR>", opts)
map("n", "<c-4>", ":BufferLineGoToBuffer 4 <CR>", opts)
map("n", "<c-5>", ":BufferLineGoToBuffer 5 <CR>", opts)
map("n", "<c-6>", ":BufferLineGoToBuffer 6 <CR>", opts)
map("n", "<c-7>", ":BufferLineGoToBuffer 7 <CR>", opts)
map("n", "<c-8>", ":BufferLineGoToBuffer 8 <CR>", opts)
map("n", "<c-9>", ":BufferLineGoToBuffer 9 <CR>", opts)

-- Navigate vim panes better
map("n", "<c-k>", ":wincmd k<CR>", opts)
map("n", "<c-j>", ":wincmd j<CR>", opts)
map("n", "<c-h>", ":wincmd h<CR>", opts)
map("n", "<c-l>", ":wincmd l<CR>", opts)

-- set shortcut for Neotree
map("n", "<C-n>", ":Neotree reveal <CR>", opts)
map("n", "<C-g>", ":Neotree toggle git_status <CR>", opts)

-- set shortcut for LSP
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- set shortcut for format code
map("n", "<leader>gf", vim.lsp.buf.format, {})

-- set dismiss noice message
map("n", "<leader>ds", ":NoiceDismiss <CR>", opts)

-- set get preview code with gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk <CR>", opts)

-- set telescope key bind
map("n", "<leader>fb", ":Telescope buffers <CR>", {})
map("n", "<leader>fh", ":Telescope help_tags <CR>", {})
map("n", "<leader>ff", ":Telescope find_files <CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep <CR>", opts)

-- debugging key bind
map("n", "<leader>dt", ":DapToggleBreakpoint <CR>", opts)
map("n", "<leader>dc", ":Dapcontinue <CR>", opts)
