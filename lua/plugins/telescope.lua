return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"jvgrootveld/telescope-zoxide",
		},
		config = function() end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local z_utils = require("telescope._extensions.zoxide.utils")

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				zoxide = {
					prompt_title = "[ Zoxide List ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function()
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("zoxide")
		end,
	},
}
