local g = vim.g
local keymap = vim.keymap
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.wo.number = true
-- setup leader key
g.mapleader = " "
g.maplocalleader = " "
-- setup path of python for plugin integration
g.python3_host_prog = "/home/novis/miniconda3/envs/py3.8/bin/python3"
-- floaterm settings
g.floaterm_keymap_toggle = "<F12>"
-- j k to leave insert mode
keymap.set("i", "jk", "<ESC>")
-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlight" })
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
-- delete key with going back
keymap.set("n", "x", '"_x')
-- increase and decrease number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
-- J stay in place
keymap.set("n", "J", "mzJ`z")
-- window
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split Vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split Horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make Equally" })
keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close Current" })
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>", { desc = "Maximize Current" })
-- adjust window size
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
-- open new tab, close tab, go to next, go to prev
-- tab: collections of windows
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open Tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Tab" })
keymap.set("n", "<leader>tl", "tabn<CR>", { desc = "Next Tab" })
keymap.set("n", "<leader>th", ":tabp<CR>", { desc = "Prev Tab" })
-- bufferlines move between buffers (buffer just like tabs in vscode)
keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
keymap.set("n", "<leader>bx", ":Bdelete<CR>", { desc = "Delete Buffer" })
-- better w,e,b
keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
--telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
keymap.set(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	{ desc = "Find Files" }
)
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep String" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- Codeium
keymap.set("i", "<C-e>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })
-- visual mode
-- shift + "<" or ">" to move lines
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- lsp saga
-- Rename all occurrences of the hovered word for the entire file
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap.set("n", "gp", "<cmd>Lspsaga goto_definition<CR>")
keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- trouble
keymap.set("n", "gt", "<cmd>TroubleToggle<cr>")
-- toggleAlternate
keymap.set("n", "<leader>ta", ":ToggleAlternate<CR>")
-- treesj
keymap.set("n", "<leader>tj", ":TSJToggle<CR>")
-- lazygit
keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "LazyGit" })
-- jupyter controls
keymap.set("n", "<leader>38", ":JukitOut conda activate py3.8<CR>")
-- Window and Sending Codes
keymap.set("n", "<A-CR>", "<cmd>call jukit#send#line()<cr>", { noremap = true, silent = true })
keymap.set("v", "<A-CR>", "<esc><cmd>call jukit#send#selection(0)<cr>", { noremap = true, silent = true })

-- plugin keymap setups with whichkey
local wk_status, wk = pcall(require, "which-key")
if not wk_status then
	return
end

wk.register({
	["<leader>f"] = { name = "+file" },
	["<leader>b"] = { name = "+buffer" },
	["<leader>t"] = { name = "+tab" },
	["<leader>w"] = { name = "+window" },
	["<leader>c"] = { name = "+cell" },
})
