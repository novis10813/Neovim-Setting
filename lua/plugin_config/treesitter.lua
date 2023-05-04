local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
	return
end
treesitter.setup({
	ensure_installed = { "vim", "lua", "python" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	auto_install = false,
	-- rainbow brackets
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = require("ts-rainbow").strategy.global,
	},
})
