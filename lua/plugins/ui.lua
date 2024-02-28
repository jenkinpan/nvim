return {
	{
		-- set UI: lualine(or call it status line)
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		config = function()
			require("lualine").setup({
				options = {
					theme = "dracula",
				},
			})
		end,
	},
	{
		-- set UI: greeter interface
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		-- set UI: indent-blankline
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
				tab_char = "┊",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
	{
		-- set UI: Buffer
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				-- set catppuccin theme for bufferline
				highlights = require("catppuccin.groups.integrations.bufferline").get(),

				options = {
					indicator = {
						icon = "▎",
						style = "icon",
					},
					diagnostics = "nvim_lsp",

					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or ""
						return " " .. icon .. count
					end,

					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
						{
							filetype = "undotree",
							text = "Undo Tree",
							text_align = "center",
							separator = true,
						},
					},
					show_close_icon = false,
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)

						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			require("ufo").setup({
				fold_virt_text_handler = handler,
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		-- set UI: statuscol
		-- statuscol used for ufo no number when fold shows
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
			})
		end,
	},
	{
		-- set UI for notification, cmdline and popupmenu
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
					filter = {
						{
							view = "notify",
							filter = { event = "msg_showmode" },
						},
						event = "notify",
						fidn = "No information available",
					},
					opts = { skip = true },
				},
				views = {
					-- set cmdline_popup and popupmenu position
					cmdline_popup = {
						position = {
							row = "50%",
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						position = {
							row = "71%",
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
				presets = {
					bottom_search = true,
					command_palette = false,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},
}
