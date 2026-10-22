local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type pria.HighlightsFn
function M.get(c, opts)
	local ret = {
		CmpDocumentation = { fg = c.fg, bg = c.bg2 },
		CmpGhostText = { fg = c.fg2 },
		CmpItemAbbr = { bg = c.none },
		CmpItemAbbrDeprecated = { fg = c.fg2, bg = c.none, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.fg, bg = c.none },
		CmpItemAbbrMatchFuzzy = { fg = c.fg, bg = c.none },
		CmpItemMenu = { bg = c.none },
	}

	require("pria.groups.kinds").kinds(ret, "CmpItemKind%s")
	return ret
end

return M
