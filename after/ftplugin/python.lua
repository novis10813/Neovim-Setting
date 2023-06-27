local keymap = vim.keymap
-- jupyter controls
keymap.set("n", "<leader>38", ":JukitOut conda activate py3.8<CR>")
-- Window and Sending Codes
keymap.set("n", "<A-CR>", "<cmd>call jukit#send#line()<cr>", { noremap = true, silent = true })
keymap.set("v", "<A-CR>", "<esc><cmd>call jukit#send#selection(0)<cr>", { noremap = true, silent = true })

local wk_status, wk = pcall(require, "which-key")
if not wk_status then
    return
end

wk.register({
    ["<leader>c"] = { name = "+cell" },
})
