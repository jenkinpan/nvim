-- lua/plugins/none-ls.lua

local ok, null_ls = pcall(require, "null-ls")  -- none-ls 还是用 null-ls 这个模块名
if not ok then
  return
end

-- 这里举几个常用 builtin，你按自己需要删减/替换
local builtins = null_ls.builtins

null_ls.setup({
  debug = false,
  sources = {
    -- 诊断
    builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc", ".eslintrc.js", "eslint.config.js" })
      end,
    }),
    builtins.diagnostics.flake8,
    builtins.diagnostics.luacheck,

    -- code actions
    builtins.code_actions.gitsigns,
    builtins.code_actions.eslint_d,

    -- completion 示例
    builtins.completion.spell,
    -- 如果你想让 none-ls 也能参与格式化，可以小心打开一些：
    -- builtins.formatting.stylua,  -- 但你已经用 conform 管 lua 了，就不建议重复
  },
  on_attach = function(client, bufnr)
    -- 如果你坚持用 conform 统一格式化，这里可以关掉 none-ls 的 formatting 能力
    if client.supports_method("textDocument/formatting") then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
})

