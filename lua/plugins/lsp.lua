-- lua/plugins/lsp.lua

local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	return
end

local ok_mason, mason = pcall(require, "mason")
if ok_mason then
	mason.setup({}) -- 防御性：即使 mason.lua 没先跑，这里也能补一刀
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
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- mason-lspconfig：声明要安装哪些 server
mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "tsserver" },
	automatic_installation = true,
})

-- 不用 setup_handlers，自己 loop 一遍
local servers = { "lua_ls", "pyright", "rust_analyzer", "tsserver" }

for _, server in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == "lua_ls" then
		opts.settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
			},
		}
	end

	lspconfig[server].setup(opts)
end
