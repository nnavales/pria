local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		TelescopeNormal = { fg = c.fg, bg = c.bg2 },
		TelescopePromptNormal = { fg = c.fg, bg = c.bg2 },
		TelescopeResultsNormal = { fg = c.muted, bg = c.bg2 },

		TelescopeSelection = { fg = c.fg, bg = c.selection },
		TelescopeResultsComment = { fg = c.muted },

		TelescopeMatching = { fg = c.match },
		TelescopeResultsIdentifier = { fg = c.fg },

		TelescopePromptBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		TelescopeBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		TelescopeResultsBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		TelescopePreviewBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },

		TelescopeTitle = { fg = c.title, bold = true },
		TelescopePromptTitle = { fg = c.title, bg = c.border },
		TelescopeResultsTitle = { fg = c.title, bg = c.border },
		TelescopePreviewTitle = { fg = c.title, bg = c.border },
	}
end

return M
