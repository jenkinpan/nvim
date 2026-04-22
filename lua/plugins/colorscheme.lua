require("auto-dark-mode").setup({
	opts = {
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			vim.cmd("colorscheme tokyonight")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "light", {})
			vim.cmd("colorscheme tokyonight")
		end,
	},
})

require("tokyonight").setup({
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		-- set lualine and snake.explore transparent
		on_colors = function(colors)
			colors.bg_statusline = colors.none
		end,
		on_highlights = function(hl, c)
			-- TabLineFill is currently set to black
			hl.TabLineFill = {
				bg = c.none,
			}
		end,
	},
})
