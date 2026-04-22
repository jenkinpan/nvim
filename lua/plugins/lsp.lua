-- lua/plugins/lsp.lua

-- 【核心修复】：强制提前加载 mason 的配置文件
-- 解决按字母排序时，"lsp.lua" 比 "mason.lua" 先执行导致的依赖崩溃问题
require("plugins.mason")

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
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- 将你要安装的 Server 定义成一个列表 (已将 tsserver 修改为 ts_ls)
local servers = { "lua_ls", "pyright", "rust_analyzer", "ts_ls" }

-- mason-lspconfig：声明确保安装这些 server
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- 放弃 setup_handlers，使用最稳妥的 for 循环进行配置
for _, server in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- 针对 lua_ls 单独设置
	if server == "lua_ls" then
		opts.settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				-- 诊断的 globals 已经被 lazydev.nvim 自动接管，不再需要硬编码 "vim"
			},
		}
	end

	lspconfig[server].setup(opts)
end
