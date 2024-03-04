return {
	"nvim-neorg/neorg",
	dependencies = { "nvim-lua/plenary.nvim" },
	build = ":Neorg sync-parsers",
	-- tag = "*",
	lazy = true, -- enable lazy load
	ft = "norg", -- lazy load on file type
	cmd = "Neorg", -- lazy load on command
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {},
				["core.export"] = {},
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
			},
		})
	end,
}
