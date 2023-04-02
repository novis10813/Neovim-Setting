local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

g.mapleader = " "
g.maplocalleader = " "
-- j k to leave insert mode
keymap.set("i", "jk", "<ESC>")
-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- split window vertically
keymap.set("n", "<leader>wv", "<C-w>v")
-- split window horizontally
keymap.set("n", "<leader>wh", "<C-w>s")
-- make split windows equal width
keymap.set("n", "<leader>we", "<C-w>=")
-- close current split window
keymap.set("n", "<leader>wx", ":close<CR>")
-- maximize split window
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
-- adjust window size
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
-- open new tab, close tab, go to next, go to prev
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", "tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- visual mode
-- shift + "<" or ">" to move lines
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- Move text up and down
keymap.set("v", "<A-j>", ":m .+2<CR>==")
keymap.set("v", "<A-k>", ":m .-2<CR>==")

opt.backspace = "2"
opt.showcmd = true
opt.laststatus = 4
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
-- opt.backspace = indent,eol,start

opt.wrap = false
-- search
opt.ignorecase = true
opt.smartcase = true



vim.wo.number = true

-- indent
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

--clipboard
opt.clipboard:append('unnamedplus')

-- split window
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append('-')

