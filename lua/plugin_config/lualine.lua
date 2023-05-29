local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
