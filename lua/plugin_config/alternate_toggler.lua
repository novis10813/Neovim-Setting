local toggler_status, toggler = pcall(require, "alternate_toggler")
if not toggler_status then
	return
end

toggler.setup({})
