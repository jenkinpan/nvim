local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		separator_style = "slant",
		show_buffer_close_icons = false,
		show_close_icon = false,
		sort_by = "insert_after_current",
		offsets = {
			{
				filetype = "snacks_layout_box",
				text = "Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
			{
				filetype = "snacks_picker_list",
				text = "Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
			{
				filetype = "mason",
				text = "Mason",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
		diagnostics_indicator = function(_, _, diagnostics_dict)
			local parts = {}
			local icons = {
				error = "E",
				warning = "W",
				info = "I",
				hint = "H",
			}

			for level, count in pairs(diagnostics_dict) do
				local icon = icons[level]
				if icon and count > 0 then
					table.insert(parts, icon .. count)
				end
			end

			return table.concat(parts, " ")
		end,
	},
})
