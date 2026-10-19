local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type pria.HighlightsFn
function M.get(c, opts)
	local ret = {
		CmpDocumentation = { fg = c.fg, bg = c.surface },
		CmpGhostText = { fg = c.muted },
		CmpItemAbbr = { fg = c.subtle, bg = c.none },
		CmpItemAbbrDeprecated = { fg = c.muted, bg = c.none, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.fg, bg = c.none },
		CmpItemAbbrMatchFuzzy = { fg = c.fg, bg = c.none },
		CmpItemMenu = { fg = c.muted, bg = c.none },
	}

	require("pria.groups.kinds").kinds(ret, "CmpItemKind%s")
	return ret
end

return M
