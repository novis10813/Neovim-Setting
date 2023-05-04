local surround_status, surround = pcall(require, "nvim-surround")
if not surround_status then
	return
end

surround.setup()
