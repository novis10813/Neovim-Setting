local spider_status, spider = pcall(require, "spider")
if not spider_status then
	return
end

-- default value
require("spider").setup({
	skipInsignificantPunctuation = false,
})
