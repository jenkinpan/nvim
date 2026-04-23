-- lua/plugins/lsp.lua
local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
	return
end

local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("n", "gi", vim.lsp.buf.implementation, "[LSP] Implementation")
	map("n", "K", vim.lsp.buf.hover, "[LSP] Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code Action")
	map("n", "<leader>fd", function()
		vim.diagnostic.open_float(nil, { focus = false })
	end, "[LSP] Line Diagnostics")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
			},
		},
	},
	pyright = {},
	rust_analyzer = {},
	ts_ls = {},
}

-- mason-lspconfig：声明确保安装这些 server
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,
})

for server, server_opts in pairs(servers) do
	local opts = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, server_opts)

	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
end
