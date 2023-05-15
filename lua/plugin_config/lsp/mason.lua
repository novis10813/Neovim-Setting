local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"clangd",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"black",
		"stylua",
		"flake8",
		"cpplint",
		"clang_format",
	},
})
