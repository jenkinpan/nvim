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
				l = { "<cmd>Lazy<cr>", "Lazy" },
				b = {
					name = "Buffers",
					p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
					c = { "<cmd>BufferLinePickClose<cr>", "Close pick" },
					o = { "<cmd>BufferLineCloseOthers<cr>", "Close others" },
				},
				c = {
					name = "Code Actions",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					f = { vim.lsp.buf.format, "Code Format" },
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
					s = { "<cmd>Neotree toggle git_status<cr>", "Git Status" },
					p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
				},
				z = {
					name = "Fold Commands",
					o = { "<cmd>foldopen<cr>", "Close fold" },
					c = { "<cmd>foldclose<cr>", "Close fold" },
				},
			},
		})
	end,
}
