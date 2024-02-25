return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		require("mason-null-ls").setup({
			ensure_installed = {
				-- Opt to list sources here, when available in mason.
				"black",
				"prettier",
				"black",
				"stylua",
				"shfmt",
				"markdownlint",
				"clangd",
			},
			automatic_installation = true,
			handlers = {},
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.rust_analyzer,
				null_ls.builtins.diagnostics.eslint_language_server,
				null_ls.builtins.formatting.black,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.clangd,
				null_ls.builtins.formatting.clangd,
			},
		})
	end,
}
