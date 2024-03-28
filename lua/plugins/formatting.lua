return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier", "rustywind" },
				python = { "black" },
				yaml = { "prettier" },
				json = { "prettier" },
				vue = { "prettier", "rustywind" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			},
		})
	end,
}
