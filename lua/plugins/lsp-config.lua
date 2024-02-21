return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"black",
					"eslint",
					"rust_analyzer",
					"tsserver",
					"volar",
					"ast_grep",
					"emmet_ls",
					"stylua",
					"lua_ls",
					"eslint_d",
					"prettier",
				},
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
		end,
	},
}
