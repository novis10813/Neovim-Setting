local leap_status, leap = pcall(require, "leap")
if not leap_status then
	return
end

-- leap.setup()
leap.add_default_mappings()
