local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. ".lua"] = true,
				},
			},
		},
	},
})
lspconfig["pyright"].setup({
	capabilities = capabilities,
})

lspconfig["clangd"].setup({
	capabilities = capabilities,
})
