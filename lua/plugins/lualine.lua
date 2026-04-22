local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		theme = "tokyonight",
		icons_enabled = true,
		globalstatus = true, -- 整个底部一条 statusline（需要 Neovim 0.7+）
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree", "lazy", "mason", "Trouble", "noice" },
			winbar = {},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } }, -- 显示相对路径
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
