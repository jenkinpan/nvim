return {
	{
		"nvim-neorg/neorg",
		dependencies = { {
			"vhyrro/luarocks.nvim",
			priority = 1000,
			config = true,
		} },
		lazy = true, -- enable lazy load
		ft = "norg", -- lazy load on file type
		cmd = "Neorg", -- lazy load on command
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.summary"] = {},
					["core.ui"] = {},
					["core.integrations.treesitter"] = {
						config = {
							configure_parsers = true,
							install_parsers = true,
						},
					},
					["core.export"] = {
						config = {
							export_dir = "/home/jenkin/Documents/markdown-export",
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Documents/notes",
							},
							index = "index.norg",
						},
					},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.qol.toc"] = {
						config = {
							close_after_use = true,
						},
					},
					["core.presenter"] = {
						config = {
							zen_mode = "zen-mode",
						},
					},
					["core.esupports.metagen"] = {
						config = {
							update_date = true,
						},
					},
				},
			})
		end,
	},
}
