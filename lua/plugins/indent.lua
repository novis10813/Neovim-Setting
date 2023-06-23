local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status then
	return
end

indent_blankline.setup({
	char = "|",
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = false,
	show_end_of_line = true,
	space_char_blankline = " ",
})
