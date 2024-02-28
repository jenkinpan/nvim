vim.g.mapleader = " " -- set <space> key as leader key
vim.g.maplocalleader = " " -- set <space> key as local leader key

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- KeyBind
-- Allow clipboard copy paste in neovim
map("", "<C-v>", "+p<CR>", opts)
map("!", "<C-v>", "<C-R>+", opts)
map("t", "<C-v>", "<C-R>+", opts)
map("v", "<C-v>", "<C-R>+", opts)

-- Open Lazy
map("n", "<leader>l", ":Lazy <CR>", opts)

-- Open Mason
map("n", "<leader>M", ":Mason <CR>", opts)

-- cancel highlight search result for /
map("n", "<leader>n", ":noh <CR>", opts)

-- Toggle Symbols Outline
map("n", "<leader>so", ":SymbolsOutline <CR>", opts)

-- set keybind of folds
map("n", "<leader>zc", ":foldclose <CR>", opts)
map("n", "<leader>zo", ":foldopen <CR>", opts)

-- set KeyBind for BufferLine
map("n", "<leader>bp", ":BufferLinePick <CR>", opts) -- go to a specific buffer
map("n", "<leader>bc", ":BufferLinePickClose <CR>", opts) -- close a specific buffer
map("n", "<leader>bo", ":BufferLineCloseOthers <CR>", opts) -- close other buffers

-- set choose buffer by cycle next
map("n", "<leader><tab>", ":BufferLineCycleNext <CR>", opts)

-- set choose buffer by number
map("n", "<leader>b1", ":BufferLineGoToBuffer 1 <CR>", opts)
map("n", "<leader>b2", ":BufferLineGoToBuffer 2 <CR>", opts)
map("n", "<leader>b3", ":BufferLineGoToBuffer 3 <CR>", opts)
map("n", "<leader>b4", ":BufferLineGoToBuffer 4 <CR>", opts)
map("n", "<leader>b5", ":BufferLineGoToBuffer 5 <CR>", opts)
map("n", "<leader>b6", ":BufferLineGoToBuffer 6 <CR>", opts)
map("n", "<leader>b7", ":BufferLineGoToBuffer 7 <CR>", opts)
map("n", "<leader>b8", ":BufferLineGoToBuffer 8 <CR>", opts)
map("n", "<leader>b9", ":BufferLineGoToBuffer 9 <CR>", opts)

-- Navigate vim panes better
map("n", "<c-k>", ":wincmd k<CR>", opts)
map("n", "<c-j>", ":wincmd j<CR>", opts)
map("n", "<c-h>", ":wincmd h<CR>", opts)
map("n", "<c-l>", ":wincmd l<CR>", opts)

function _G.set_terminal_keymaps()
	local opt = { buffer = 0 }
	-- close terminal mode, enter normal mode
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opt)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opt)

	-- set window panes jumping
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)

	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opt)
end

vim.cmd("autocmd! TermOpen term://*  lua set_terminal_keymaps()")

-- set terminal toggle
map("n", "<leader>`", ":ToggleTerm <CR>", opts)
map("t", "<leader>`", [[<Cmd>ToggleTerm <CR>]], opts)

-- set shortcut for Neotree
map("n", "<C-n>", ":Neotree reveal <CR>", opts)
map("n", "<C-g>", ":Neotree toggle git_status <CR>", opts)

-- set shortcut for LSP
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- set shortcut for format code
map("n", "<leader>cf", vim.lsp.buf.format, {}, "format code")

-- set dismiss noice message
map("n", "<leader>ds", ":NoiceDismiss <CR>", opts)

-- Git Stuffs
-- set get preview code with gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk <CR>", opts)
-- open LazyGit
map("n", "<leader>gg", ":LazyGit <CR>", opts)
-- open Telescope git repos
map("n", "<leader>gr", function()
	require("telescope").extensions.lazygit.lazygit()
end, opts)

-- set telescope key bind
map("n", "<leader>fb", ":Telescope buffers <CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags <CR>", opts)
map("n", "<leader>ff", ":Telescope find_files <CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep <CR>", opts)

-- debugging key bind
map("n", "<leader>dt", ":DapToggleBreakpoint <CR>", opts)
map("n", "<leader>dc", ":Dapcontinue <CR>", opts)

-- UndoTree key bind
map("n", "<leader>ut", ":UndotreeToggle <CR>", opts)
map("n", "<leader>uf", ":UndotreeFocus <CR>", opts)

-- Trouble key bind
map("n", "<leader>xx", ":TroubleToggle <CR>", opts)
map("n", "<leader>xw", ":TroubleToggle lsp_workspace_diagnostics <CR>", opts)
map("n", "<leader>xd", ":TroubleToggle lsp_document_diagnostics <CR>", opts)
map("n", "<leader>xq", ":TroubleToggle quickfix <CR>", opts)
map("n", "<leader>xl", ":TroubleToggle loclist <CR>", opts)
map("n", "gR", ":TroubleToggle lsp_references <CR>", opts)
