local whichkey_status, whichkey = pcall(require, "which-key")
if not whichkey_status then
	return
end

whichkey.setup({})
