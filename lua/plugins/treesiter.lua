return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"HiPhish/nvim-ts-rainbow2",
			{
				"abecodes/tabout.nvim",
				opts = {
					tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
					backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
					act_as_tab = false, -- shift content if tab out is not possible
					act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
					default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
					default_shift_tab = "<C-d>", -- reverse shift default action,
					enable_backwards = true, -- well ...
					completion = true, -- if the tabkey is used in a completion pum
					tabouts = {
						{ open = "'", close = "'" },
						{ open = '"', close = '"' },
						{ open = "`", close = "`" },
						{ open = "(", close = ")" },
						{ open = "[", close = "]" },
						{ open = "{", close = "}" },
					},
					ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
					exclude = {}, -- tabout will ignore these filetypes
				},
			},
		},
		cmd = { "TSUpdateSync" },
		keys = {
			{ "<cr>", desc = "Incremental selection" },
			{ "<bs>", desc = "Decremental selection" },
		},
		opts = {
			highlight = { enable = true, additional_vim_regex_highlighting = true },
			indent = { enable = true },
			ensure_installed = {
				"c",
				"lua",
				"python",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
