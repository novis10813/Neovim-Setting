local wk_status, wk = pcall(require, "which-key")
if not wk_status then
    return
end

wk.register({
    ["<leader>c"] = { name = "+cell" },
})
