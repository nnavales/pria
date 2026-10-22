local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		TelescopeNormal = { fg = c.fg, bg = c.bg2 },
		TelescopePromptNormal = { fg = c.fg, bg = c.bg2 },
		TelescopePromptPrefix = { fg = c.fg },
		TelescopeResultsNormal = { fg = c.fg, bg = c.bg2 },

		TelescopeSelection = { bg = c.selection },
		TelescopeSelectionCaret = { fg = c.fg },
		TelescopeResultsComment = { fg = c.fg2 },

		TelescopeMatching = { fg = c.match },
		TelescopeResultsIdentifier = { fg = c.fg },

		TelescopePromptBorder = { fg = opts.borders and c.bg3 or c.bg2, bg = c.bg2 },
		TelescopeBorder = { fg = opts.borders and c.bg3 or c.bg2, bg = c.bg2 },
		TelescopeResultsBorder = { fg = opts.borders and c.bg3 or c.bg2, bg = c.bg2 },
		TelescopePreviewBorder = { fg = opts.borders and c.bg3 or c.bg2, bg = c.bg2 },

		TelescopeTitle = { fg = c.title },
		TelescopePromptTitle = { fg = c.title },
		TelescopeResultsTitle = { fg = c.title },
		TelescopePreviewTitle = { fg = c.title },
	}
end

return M
