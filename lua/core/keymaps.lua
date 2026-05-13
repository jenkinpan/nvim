vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local plugin_config_dir = vim.fn.stdpath("config") .. "/lua/plugins"

local function load_module(module, label)
	local ok, mod = pcall(require, module)
	if ok then
		return mod
	end

	vim.notify(("%s is not available"):format(label or module), vim.log.levels.WARN)
end

local function with_snacks(callback)
	return function()
		local snacks = load_module("snacks", "snacks.nvim")
		if snacks then
			callback(snacks)
		end
	end
end

local function pick(method, opts_or_fn)
	return with_snacks(function(s)
		local o = type(opts_or_fn) == "function" and opts_or_fn() or opts_or_fn
		s.picker[method](o)
	end)
end

local function trouble_cmd(command)
	return function()
		if load_module("plugins.trouble", "trouble.nvim") then
			vim.cmd(command)
		end
	end
end

local function plugin_cmd(module, command, label)
	return function()
		if load_module(module, label) then
			vim.cmd(command)
		end
	end
end

-- Windows
map("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
map("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to lower window" }))
map("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to upper window" }))
map("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to right window" }))

-- Buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin Buffer" })
map("n", "<leader>bb", "<C-^>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>bdelete<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>bd", with_snacks(function(s) s.bufdelete() end), { desc = "Delete Buffer" })

-- General
map({ "n", "i", "x", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "<leader>cd", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Line Diagnostics" })

-- Trouble
map("n", "<leader>xx", trouble_cmd("Trouble diagnostics toggle"), { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", trouble_cmd("Trouble diagnostics toggle filter.buf=0"), { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", trouble_cmd("Trouble symbols toggle focus=false"), { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", trouble_cmd("Trouble lsp toggle focus=false win.position=right"), { desc = "LSP (Trouble)" })
map("n", "<leader>cm", plugin_cmd("plugins.mason", "Mason", "mason.nvim"), { desc = "Mason" })
map("n", "<leader>xL", trouble_cmd("Trouble loclist toggle"), { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", trouble_cmd("Trouble qflist toggle"), { desc = "Quickfix List (Trouble)" })

-- Explorer
map("n", "<leader>e", with_snacks(function(s) s.explorer() end), { desc = "File Explorer" })
map("n", "<leader>E", with_snacks(function(s) s.explorer({ cwd = vim.fn.getcwd() }) end), { desc = "File Explorer (cwd)" })

-- Top pickers
map("n", "<leader><space>", pick("smart"), { desc = "Smart Find Files" })
map("n", "<leader>,",       pick("buffers"), { desc = "Buffers" })
map("n", "<leader>/",       pick("grep"), { desc = "Grep" })
map("n", "<leader>:",       pick("command_history"), { desc = "Command History" })

-- Find
map("n", "<leader>fb", pick("buffers"), { desc = "Buffers" })
map("n", "<leader>fc", pick("files", function() return { cwd = vim.fn.stdpath("config") } end), { desc = "Find Config File" })
map("n", "<leader>ff", pick("files"), { desc = "Find Files" })
map("n", "<leader>fF", pick("files", function() return { cwd = vim.fn.getcwd() } end), { desc = "Find Files (cwd)" })
map("n", "<leader>fg", pick("git_files"), { desc = "Find Git Files" })
map("n", "<leader>fp", pick("projects"), { desc = "Projects" })
map("n", "<leader>fr", pick("recent"), { desc = "Recent" })

-- Git pickers
map("n", "<leader>gb", pick("git_branches"), { desc = "Git Branches" })
map("n", "<leader>gl", pick("git_log"), { desc = "Git Log" })
map("n", "<leader>gL", pick("git_log_line"), { desc = "Git Log Line" })
map("n", "<leader>gs", pick("git_status"), { desc = "Git Status" })
map("n", "<leader>gS", pick("git_stash"), { desc = "Git Stash" })
map("n", "<leader>gd", pick("git_diff"), { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", pick("git_log_file"), { desc = "Git Log File" })

-- GitHub pickers
map("n", "<leader>gi", pick("gh_issue"), { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", pick("gh_issue", { state = "all" }), { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", pick("gh_pr"), { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", pick("gh_pr", { state = "all" }), { desc = "GitHub Pull Requests (all)" })

-- Search / grep pickers
map("n",        "<leader>sb",  pick("lines"), { desc = "Buffer Lines" })
map("n",        "<leader>sB",  pick("grep_buffers"), { desc = "Grep Open Buffers" })
map("n",        "<leader>sg",  pick("grep"), { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", pick("grep_word"), { desc = "Visual selection or word" })
map("n", '<leader>s"', pick("registers"), { desc = "Registers" })
map("n", "<leader>s/",  pick("search_history"), { desc = "Search History" })
map("n", "<leader>sa",  pick("autocmds"), { desc = "Autocmds" })
map("n", "<leader>sc",  pick("command_history"), { desc = "Command History" })
map("n", "<leader>sC",  pick("commands"), { desc = "Commands" })
map("n", "<leader>sd",  pick("diagnostics"), { desc = "Diagnostics" })
map("n", "<leader>sD",  pick("diagnostics_buffer"), { desc = "Buffer Diagnostics" })
map("n", "<leader>sh",  pick("help"), { desc = "Help Pages" })
map("n", "<leader>sH",  pick("highlights"), { desc = "Highlights" })
map("n", "<leader>si",  pick("icons"), { desc = "Icons" })
map("n", "<leader>sj",  pick("jumps"), { desc = "Jumps" })
map("n", "<leader>sk",  pick("keymaps"), { desc = "Keymaps" })
map("n", "<leader>sl",  pick("loclist"), { desc = "Location List" })
map("n", "<leader>sm",  pick("marks"), { desc = "Marks" })
map("n", "<leader>sM",  pick("man"), { desc = "Man Pages" })
map("n", "<leader>sn",  pick("notifications"), { desc = "Notification Picker" })
map("n", "<leader>snh", "<cmd>Noice history<cr>", { desc = "Noice History" })
map("n", "<leader>snl", "<cmd>Noice last<cr>", { desc = "Noice Last Message" })
map("n", "<leader>snd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss All" })
map("n", "<leader>sna", "<cmd>Noice all<cr>", { desc = "Noice All" })
map("n", "<leader>sp",  pick("files", { cwd = plugin_config_dir }), { desc = "Find Plugin Config" })
map("n", "<leader>sq",  pick("qflist"), { desc = "Quickfix List" })
map("n", "<leader>sR",  pick("resume"), { desc = "Resume" })
map("n", "<leader>su",  pick("undo"), { desc = "Undo History" })
map("n", "<leader>uC",  pick("colorschemes"), { desc = "Colorschemes" })

-- LSP pickers
map("n", "gd",         pick("lsp_definitions"), { desc = "Goto Definition" })
map("n", "gD",         pick("lsp_declarations"), { desc = "Goto Declaration" })
map("n", "gr",         pick("lsp_references"), { desc = "References", nowait = true })
map("n", "gI",         pick("lsp_implementations"), { desc = "Goto Implementation" })
map("n", "gy",         pick("lsp_type_definitions"), { desc = "Goto Type Definition" })
map("n", "gai",        pick("lsp_incoming_calls"), { desc = "Calls Incoming" })
map("n", "gao",        pick("lsp_outgoing_calls"), { desc = "Calls Outgoing" })
map("n", "<leader>ss", pick("lsp_symbols"), { desc = "LSP Symbols" })
map("n", "<leader>sS", pick("lsp_workspace_symbols"), { desc = "LSP Workspace Symbols" })

-- Snacks UI
map("n", "<leader>z",  with_snacks(function(s) s.zen() end), { desc = "Toggle Zen Mode" })
map("n", "<leader>Z",  with_snacks(function(s) s.zen.zoom() end), { desc = "Toggle Zoom" })
map("n", "<leader>.",  with_snacks(function(s) s.scratch() end), { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S",  with_snacks(function(s) s.scratch.select() end), { desc = "Select Scratch Buffer" })
map("n", "<leader>n",  with_snacks(function(s) s.notifier.show_history() end), { desc = "Notification History" })
map("n", "<leader>cR", with_snacks(function(s) s.rename.rename_file() end), { desc = "Rename File" })
map({ "n", "v" }, "<leader>gB", with_snacks(function(s) s.gitbrowse() end), { desc = "Git Browse" })
map("n", "<leader>gg", with_snacks(function(s) s.lazygit() end), { desc = "Lazygit" })
map("n", "<leader>un", with_snacks(function(s) s.notifier.hide() end), { desc = "Dismiss All Notifications" })
map("n", "<c-/>",      with_snacks(function(s) s.terminal() end), { desc = "Toggle Terminal" })
map("n", "<c-_>",      with_snacks(function(s) s.terminal() end), { desc = "which_key_ignore" })
map({ "n", "t" }, "]]", with_snacks(function(s) s.words.jump(vim.v.count1) end), { desc = "Next Reference" })
map({ "n", "t" }, "[[", with_snacks(function(s) s.words.jump(-vim.v.count1) end), { desc = "Prev Reference" })

-- Neovim News
map("n", "<leader>N", with_snacks(function(s)
	s.win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		width = 0.6,
		height = 0.6,
		wo = {
			spell = false,
			wrap = false,
			signcolumn = "yes",
			statuscolumn = " ",
			conceallevel = 3,
		},
	})
end), { desc = "Neovim News" })
