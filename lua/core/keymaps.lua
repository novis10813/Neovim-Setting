local g = vim.g
local keymap = vim.keymap
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.wo.number = true
-- setup path of python for plugin integration
g.python3_host_prog = "/home/novis/miniconda3/envs/py3.8/bin/python3"
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
-- better w,e,b
keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
--telescope
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
keymap.set("i", "<C-\\>", function()
    return vim.fn["codeium#Accept"]()
end, { expr = true, remap = true })
-- visual mode
-- shift + "<" or ">" to move lines
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
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
})
