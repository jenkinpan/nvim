local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	return
end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
	return
end

local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("n", "gd", vim.lsp.buf.definition, "[LSP] Goto Definition")
	map("n", "gr", vim.lsp.buf.references, "[LSP] References")
	map("n", "gi", vim.lsp.buf.implementation, "[LSP] Implementation")
	map("n", "K", vim.lsp.buf.hover, "[LSP] Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code Action")
	map("n", "<leader>fd", function()
		vim.diagnostic.open_float(nil, { focus = false })
	end, "[LSP] Line Diagnostics")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 如果以后加 nvim-cmp，可以在这里扩展 capabilities

-- 用 mason 安装这些 server
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
	},
	automatic_installation = true,
})

-- 每个 server 通用配置
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	-- 针对 lua_ls 的特殊设置
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})
	end,
})
