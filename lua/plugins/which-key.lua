return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		require("which-key").setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
		})

		require("which-key").register({
			["<leader>"] = {
				["`"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
				b = {
					name = "Buffers",
					p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
					c = { "<cmd>BufferLinePickClose<cr>", "Close pick" },
					o = { "<cmd>BufferLineCloseOthers<cr>", "Close others" },
					["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go to buffer 1" },
					["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go to buffer 2" },
					["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go to buffer 3" },
					["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go to buffer 4" },
					["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go to buffer 5" },
				},
				c = {
					name = "Code Actions",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					f = { vim.lsp.buf.format, "Code Format" },
					s = {"<cmd>CodeSnapPreviewOn<cr>", "Open Code Snap Preview"},
				},
				d = {
					name = "Debug",
					t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
					c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
				},
				f = {
					name = "Telescope",
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					g = { "<cmd>Telescope live_grep<cr>", "Grep" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					h = { "<cmd>Telescope help_tags<cr>", "Help" },
				},
				g = {
					name = "Git Stuffs",
					p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
					g = { "<cmd>LazyGit<cr>", "LazyGit" },
					r = { "<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>", "Show historical Repos" },
				},
				l = { "<cmd>Lazy<cr>", "Open Lazy" },
				M = { "<cmd>Mason<cr>", "Open Mason" },
				o = {
					name = "Obsidian",
					b = { "<cmd>ObsidianBacklinks<cr>", "Open Backlinks" },
					c = { "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", "Toggle Checkbox" },
					l = { "<cmd>ObsidianLinks<cr>", "Open Links" },
					n = {
						name = "New Note",
						n = { "<cmd>ObsidianNew<cr>", "New Note" },
						t = { "<cmd>ObsidianNewToday<cr>", "New Today Note" },
						y = { "<cmd>ObsidianNewYesterday<cr>", "New Yesterday Note" },
						T = { "<cmd>ObsidianNewTomorrow<cr>", "New Tomorrow Note" },
					},
					o = { "<cmd>Obsidian<cr>", "Open Obsidian" },
					q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
					s = { "<cmd>ObsidianSearch<cr>", "Search Obsidian" },
				},
				s = {
					name = "Symbols Outline",
					o = { "<cmd>SymbolsOutline<cr>", "Toggle Symbols Outline" },
				},
				n = { "<cmd>noh<cr>", "Cancel highlight" },
				u = {
					name = "Undo Tree",
					t = { "<cmd>UndotreeToggle<cr>", "Toggle Undo Tree" },
					f = { "<cmd>UndotreeFocus<cr>", "Focus Undo Tree" },
				},
				x = {
					name = "Trouble",
					x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
					w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
					d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document Diagnostics" },
					q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
					l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
				},
				Z = {
					"<cmd>lua require('telescope').extensions.zoxide.list()<cr>",
					"Zoxide",
				},
				z = {
					name = "Fold Commands",
					o = { "<cmd>foldopen<cr>", "Open current fold" },
					c = { "<cmd>foldclose<cr>", "Close current fold" },
					a = { "<cmd>foldopen!<cr>", "Open all folds" },
					r = { "<cmd>foldclose!<cr>", "Close all folds" },
				},
			},
		})
	end,
}
