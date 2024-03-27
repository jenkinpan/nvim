vim.g.mapleader = " " -- set <space> key as leader key
vim.g.maplocalleader = "," -- set <space> key as local leader key

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keymaps
-- Allow clipboard copy paste in neovim
-- map("", "<C-v>", "+p<CR>", opts)
-- map("!", "<C-v>", "<C-R>+", opts)
-- map("t", "<C-v>", "<C-R>+", opts)
-- map("v", "<C-v>", "<C-R>+", opts)

-- Open Lazy
map("n", "<leader>L", "<cmd>Lazy <CR>", opts)

-- Open Mason
map("n", "<leader>M", "<cmd>Mason <CR>", opts)

-- cancel highlight search result for /
map("n", "<leader>n", "<cmd>noh <CR>", opts)

-- Toggle Symbols Outline
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts)

-- Zen Mode
map("n", "<localleader>z", "<cmd>ZenMode <CR>", opts)

vim.keymap.set("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", opts)
-- set KeyBind for BufferLine
map("n", "<leader>bp", "<cmd>BufferLinePick <CR>", opts) -- go to a specific buffer
map("n", "<leader>bc", "<cmd>BufferLinePickClose <CR>", opts) -- close a specific buffer
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers <CR>", opts) -- close other buffers

-- set choose buffer by cycle next
map("n", "<leader><tab>", "<cmd>BufferLineCycleNext <CR>", opts)

-- set choose buffer by number
map("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1 <CR>", opts)
map("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2 <CR>", opts)
map("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3 <CR>", opts)
map("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4 <CR>", opts)
map("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5 <CR>", opts)

-- Navigate vim panes better
map("n", "<c-k>", "<cmd>wincmd k<CR>", opts)
map("n", "<c-j>", "<cmd>wincmd j<CR>", opts)
map("n", "<c-h>", "<cmd>wincmd h<CR>", opts)
map("n", "<c-l>", "<cmd>wincmd l<CR>", opts)

-- set terminal toggle
map("n", "<leader>`", "<cmd>Lspsaga term_toggle<CR>", opts)
map("t", "<leader>`", [[<cmd>Lspsaga term_toggle<CR>]], opts)
-- set shortcut for Neotree
map("n", "<C-n>", "<cmd>Neotree reveal <CR>", opts)
map("n", "<C-g>", "<cmd>Neotree toggle git_status <CR>", opts)

-- set shortcut for LSP
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- set shortcut for format code
map("n", "<leader>cf", vim.lsp.buf.format, {}, "format code")

-- Open Codesnap preview for code sharing
map("n", "<leader>cs", "<cmd>CodeSnapPreviewOn<CR>", opts, { desc = "Open Codesnap Preview" })

-- set dismiss noice message
map("n", "<leader>ds", "<cmd>NoiceDismiss<CR>", opts)

-- Git Stuffs keymaps
-- set get preview code with gitsigns
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk <CR>", opts)
-- open LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)
-- open Telescope git repos
map("n", "<leader>gr", function()
	require("telescope").extensions.lazygit.lazygit()
end, opts)

-- set telescope keymaps
map("n", "<leader>fb", "<cmd>Telescope buffers <CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags <CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files <CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep <CR>", opts)

-- debugging keymaps
map("n", "<leader>dt", "<cmd>DapToggleBreakpoint <CR>", opts)
map("n", "<leader>dc", "<cmd>Dapcontinue <CR>", opts)

-- UndoTree keymaps
map("n", "<leader>ut", "<cmd>UndotreeToggle <CR>", opts)
map("n", "<leader>uf", "<cmd>UndotreeFocus <CR>", opts)

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

-- Zoxide keymaps
map("n", "<leader>Z", function()
	require("telescope").extensions.zoxide.list()
end, opts)

-- Obsidian keymaps
map(
	"n",
	"<localleader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	opts,
	{ desc = "Obsidian Check Checkbox" }
)
map("n", "<localleader>oo", "<cmd>ObsidianOpen<CR>", opts, { desc = "Open in Obsidian App" })
map("n", "<localleader>ob", "<cmd>ObsidianBacklinks<CR>", opts, { desc = "Show ObsidianBacklinks" })
map("n", "<localleader>ol", "<cmd>ObsidianLinks<CR>", opts, { desc = "Show ObsidianLinks" })
map("n", "<localleader>onn", "<cmd>ObsidianNew<CR>", opts, { desc = "Create New Note" })
map("n", "<localleader>ont", "<cmd>ObsidianToday<CR>", opts, { desc = "Create New Today Note" })
map("n", "<localleader>ony", "<cmd>ObsidianYesterday<CR>", opts, { desc = "Create New Yesterday Note" })
map("n", "<localleader>onT", "<cmd>ObsidianTomorrow<CR>", opts, { desc = "Create New Tomorrow Note" })
map("n", "<localleader>os", "<cmd>ObsidianSearch<CR>", opts, { desc = "Search Obsidian" })
map("n", "<localleader>oq", "<cmd>ObsidianQuickSwitch<CR>", opts, { desc = "Quick Switch" })

-- Neorg keymaps
-- metadata
map("n", "<localleader>im", "<cmd>Neorg inject-metadata<CR>", opts, { desc = "[neorg] Inject Metadata" })
map("n", "<localleader>u", "<cmd>Neorg update-metadata<CR>", opts, { desc = "[neorg] Update Metadata" })
-- table of contents
map("n", "<localleader>c", "<cmd>Neorg toc<CR>", opts, { desc = "[neorg] Table of Contents" })
-- journal
map("n", "<localleader>jt", "<cmd>Neorg journal today<CR>", opts, { desc = "[neorg] Journal Today" })
map("n", "<localleader>jy", "<cmd>Neorg journal yesterday<CR>", opts, { desc = "[neorg] Journal Yesterday" })
map("n", "<localleader>jT", "<cmd>Neorg journal tomorrow<CR>", opts, { desc = "[neorg] Journal Tomorrow" })
map("n", "<localleader>jc", "<cmd>Neorg journal toc<CR>", opts, { desc = "[neorg] Journal Table of Contents" })
map("n", "<localleader>jC", "<cmd>Neorg journal custom<CR>", opts, { desc = "[neorg] New Journal Custom" })
-- todo tasks
map(
	"n",
	"<localleader>ta",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_ambiguous()<CR>",
	opts,
	{ desc = "[neorg] Mark as ambiguous" }
)
map(
	"n",
	"<localleader>tc",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_cancelled()<CR>",
	opts,
	{ desc = "[neorg] Mark as cancelled" }
)
map(
	"n",
	"<localleader>td",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_done()<CR>",
	opts,
	{ desc = "[neorg] Mark as done" }
)
map(
	"n",
	"<localleader>th",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_on_hold()<CR>",
	opts,
	{ desc = "[neorg] Mark as on hold" }
)
map(
	"n",
	"<localleader>ti",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_important()<CR>",
	opts,
	{ desc = "[neorg] Mark as important" }
)
map(
	"n",
	"<localleader>tp",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_pending()<CR>",
	opts,
	{ desc = "[neorg] Mark as pending" }
)
map(
	"n",
	"<localleader>tr",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_recurring()<CR>",
	opts,
	{ desc = "[neorg] Mark as recurring" }
)
map(
	"n",
	"<localleader>tu",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_undone()<CR>",
	opts,
	{ desc = "[neorg] Mark as undone" }
)

-- Export markdown file
map("n", "<localleader>ef", "<cmd>Neorg export to-file<CR>", opts, { desc = "[neorg] Export tofile" })
map("n", "<localleader>ed", "<cmd>Neorg export directory<CR>", opts, { desc = "[neorg] Export to directory" })

-- Codeium keymaps
vim.keymap.set("i", "<tab>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-.>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-,>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
