local neoscroll_status, neoscroll = pcall(require, "neoscroll")
if not neoscroll_status then
	return
end
neoscroll.setup({
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true,
	stop_eof = true,
	respect_scrolloff = false,
	cursor_scrolls_alone = true,
	easing_function = "sine",
	pre_hook = nil,
	performance_mode = false,
})
