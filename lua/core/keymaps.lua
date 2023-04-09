local g = vim.g
local keymap = vim.keymap
-- setup leader key
g.mapleader = " "
g.maplocalleader = " "
-- setup path of python for plugin integration
g.python3_host_prog = "/home/novis/miniconda3/envs/py3.8/bin/python3"
-- j k to leave insert mode
keymap.set("i", "jk", "<ESC>")
-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- delete key with going back
keymap.set("n", "x", '"_x')
-- increase and decrease number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
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
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
-- open new tab, close tab, go to next, go to prev
-- tab: collections of windows
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", "tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
-- bufferlines move between buffers (buffer just like tabs in vscode)
keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>bx", ":Bdelete<CR>")
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
-- lsp server
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- find solution for error
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- rename class, functions, etc
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous error
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next error
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- see documentation
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>")

-- jupyter controls
keymap.set("n", "<leader>jp", ":JukitOut conda activate py3.8<CR>")
-- Window and Sending Codes
-- <leader>os Open new output window
-- <leader>hs Open new history output window
-- <leader>od Close output window
-- <leader>hd Close history window
-- <leader>ohd Close both windows
-- <leader><space> Send code within the current to the output window
-- <CR> Send current line to output split
-- <leader>cc Execute all the cells until the current cell
-- <leader>all Execute all cells
-- Cells
-- <leader>co/O o:create cell below, O:above
-- <leader>ct/T t:create text below, T:above
-- <leader>cm/M m:merge cell below, M:above
-- <leader>cd Delete current cell
-- <leader>cs Split current cell
-- <leader>ck Move current cell up
-- <leader>cj Move current cell down
-- <leader>J Go to next cell
-- <leader>K Go to previous cell
-- file conversion
-- <leader>np Conver between ipynb and py

vim.wo.number = true
