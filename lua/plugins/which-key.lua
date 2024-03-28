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
				["`"] = { "<cmd>Lspsaga term_toggle<cr>", "Toggle Terminal" },
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
					a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
					f = { vim.lsp.buf.format, "Code Format" },
					s = { "<cmd>CodeSnapPreviewOn<cr>", "Open Code Snap Preview" },
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
				l = {
					name = "Lspsaga",
					o = { "<cmd>Lspsaga outline<cr>", "Open Outline" },
					f = { "<cmd>Lspsaga finder<cr>", "Find References" },
					r = { "<cmd>Lspsaga rename<cr>", "Rename" },
				},
				L = { "<cmd>Lazy<cr>", "Open Lazy" },
				M = { "<cmd>Mason<cr>", "Open Mason" },
				n = { "<cmd>noh<cr>", "Cancel highlight" },
				u = {
					name = "Undo Tree",
					t = { "<cmd>UndotreeToggle<cr>", "Toggle Undo Tree" },
					f = { "<cmd>UndotreeFocus<cr>", "Focus Undo Tree" },
				},
				x = {
					name = "Trouble",
					x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
					w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
					d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
					q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
					l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
				},
				Z = {
					"<cmd>lua require('telescope').extensions.zoxide.list()<cr>",
					"Zoxide",
				},
			},
			[","] = {
				c = { "<cmd>Neorg toc<cr>", "[neorg] Table of Contents" },
				e = {
					name = "[neorg] Export",
					f = { "<cmd>Neorg export to-file<cr>", "[neorg] Export to file" },
					d = { "<cmd>Neorg export directory<cr>", "[neorg] Export to directory" },
				},
				t = {
					name = "[neorg] Todo Tasks",
					a = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_ambiguous()<cr>",
						"[neorg] Mark as ambiguous",
					},
					c = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_cancelled()<cr>",
						"[neorg] Mark as cancelled",
					},
					d = { "<cmd>lua require('neorg.core').qol.todo_items.todo.task_done()<cr>", "[neorg] Mark as done" },
					h = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_on_hold()<cr>",
						"[neorg] Mark as On Hold",
					},
					i = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_important()<cr>",
						"[neorg] Mark as Important",
					},
					p = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_pending()<cr>",
						"[neorg] Mark as pending",
					},
					r = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_recurring()<cr>",
						"[neorg] Mark as Recurring",
					},
					u = {
						"<cmd>lua require('neorg.core').qol.todo_items.todo.task_undone()<cr>",
						"[neorg] Mark as undone",
					},
				},
				i = {
					name = "[neorg] Insert",
					d = { "<cmd>lua require('neorg.core').tempus.insert-date()<cr>", "[neorg] Insert Date" },
					m = { "<cmd>Neorg inject-metadata<cr>", "[neorg] Inject Metadata" },
				},
				j = {
					name = "[neorg] Journal",
					c = { "<cmd>Neorg journal toc<cr>", "[neorg] Journal Table of Contents" },
					C = { "<cmd>Neorg journal custom<cr>", "[neorg] Create Journal" },
					t = { "<cmd>Neorg journal today<cr>", "[neorg] New Today Journal" },
					y = { "<cmd>Neorg journal yesterday<cr>", "[neorg] New Yesterday Journal" },
					T = { "<cmd>Neorg journal tomorrow<cr>", "[neorg] New Tomorrow Journal" },
				},
				l = {
					name = "[neorg] List",
					i = {
						"<cmd>lua require('neorg.core').pivot.invert-list-type()<cr>",
						"[neorg] Invert (Un)ordered List",
					},
					t = {
						"<cmd>lua require('neorg.core').pivot.toggle-list-type()<cr>",
						"[neorg] Toggle (Un)ordered Type",
					},
				},
				m = {
					name = "[neorg] Mode",
					n = { "<cmd>Neorg mode norg<cr>", "[neorg] Enter Norg Mode" },
					h = { "<cmd>Neorg mode traverse-heading<cr>", "[neorg] Heading Traversal Mode" },
					l = { "<cmd>Neorg mode traverse-link<cr>", "[neorg] Enter Link Traversal Mode" },
				},
				n = {
					name = "[neorg] New",
					n = { "<cmd>lua require('neorg.core').dirman.new.note()<cr>", "[neorg] Create New Note" },
				},
				o = {
					name = "Obsidian",
					b = { "<cmd>ObsidianBacklinks<cr>", "Open Backlinks" },
					c = { "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", "Toggle Checkbox" },
					l = { "<cmd>ObsidianLinks<cr>", "Open Links" },
					n = {
						name = "New Note",
						n = { "<cmd>ObsidianNew<cr>", "New Note" },
						t = { "<cmd>ObsidianToday<cr>", "New Today Note" },
						y = { "<cmd>ObsidianYesterday<cr>", "New Yesterday Note" },
						T = { "<cmd>ObsidianTomorrow<cr>", "New Tomorrow Note" },
					},
					o = { "<cmd>ObsidianOpen<cr>", "Open Obsidian" },
					q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
					s = { "<cmd>ObsidianSearch<cr>", "Search Obsidian" },
				},
				u = { "<cmd>Neorg update-metadata<cr>", "[neorg] Update Metadata" },
				z = { "<cmd>ZenMode<cr>", "Zen Mode" },
			},
		})
	end,
}
