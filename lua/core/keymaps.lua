vim.g.mapleader = " " -- set <space> key as leader key
vim.g.maplocalleader = " " -- set <space> key as local leader key

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keymaps
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

-- set keymaps for folds
map("n", "<leader>zc", ":foldclose <CR>", opts)
map("n", "<leader>zo", ":foldopen <CR>", opts)
map("n", "<leader>za", ":foldopen! <CR>", opts)
map("n", "<leader>zr", ":foldclose! <CR>", opts)

vim.keymap.set("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", opts)
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

-- Open Codesnap preview for code sharing
map("n", "<leader>cs", ":CodeSnapPreviewOn<CR>", opts, { desc = "Open Codesnap Preview" })

-- set dismiss noice message
map("n", "<leader>ds", ":NoiceDismiss<CR>", opts)

-- Git Stuffs keymaps
-- set get preview code with gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk <CR>", opts)
-- open LazyGit
map("n", "<leader>gg", ":LazyGit<CR>", opts)
-- open Telescope git repos
map("n", "<leader>gr", function()
	require("telescope").extensions.lazygit.lazygit()
end, opts)

-- set telescope keymaps
map("n", "<leader>fb", ":Telescope buffers <CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags <CR>", opts)
map("n", "<leader>ff", ":Telescope find_files <CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep <CR>", opts)

-- debugging keymaps
map("n", "<leader>dt", ":DapToggleBreakpoint <CR>", opts)
map("n", "<leader>dc", ":Dapcontinue <CR>", opts)

-- UndoTree keymaps
map("n", "<leader>ut", ":UndotreeToggle <CR>", opts)
map("n", "<leader>uf", ":UndotreeFocus <CR>", opts)

-- Trouble keymaps
map("n", "<leader>xx", function()
	require("trouble").toggle()
end) -- Toggle Trouble
map("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end) -- Toggle Workspace Trouble
map("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end) -- Toggle Document Trouble
map("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end) -- Toggle Quickfix Trouble
map("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end) -- Toggle Loclist Trouble
map("n", "gR", function()
	require("trouble").toggle("lsp_references")
end) -- Toggle LSP References

-- Obsidian keymaps
map(
	"n",
	"<leader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	opts,
	{ desc = "Obsidian Check Checkbox" }
)
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", opts, { desc = "Open in Obsidian App" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", opts, { desc = "Show ObsidianBacklinks" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", opts, { desc = "Show ObsidianLinks" })
map("n", "<leader>onn", "<cmd>ObsidianNew<CR>", opts, { desc = "Create New Note" })
map("n", "<leader>ont", "<cmd>ObsidianNewToday<CR>", opts, { desc = "Create New Today Note" })
map("n", "<leader>ony", "<cmd>ObsidianNewYesterday<CR>", opts, { desc = "Create New Yesterday Note" })
map("n", "<leader>onT", "<cmd>ObsidianNewTomorrow<CR>", opts, { desc = "Create New Tomorrow Note" })
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", opts, { desc = "Search Obsidian" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", opts, { desc = "Quick Switch" })

-- Zoxide keymaps
map("n", "<leader>Z", function()
	require("telescope").extensions.zoxide.list()
end, opts)
