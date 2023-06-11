local semantic_status, semantic = pcall(require, "nvim-semantic-tokens")
if not semantic_status then
	return
end

semantic.setup({
	preset = "default",
	highlighters = { require("nvim-semantic-tokens.table-highlighter") },
})

local function lsp_highlight(client, bufnr)
	if client.supports_method("textDocument/documentHighlight") then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({ group = "lsp_document_highlight", buffer = bufnr })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end
