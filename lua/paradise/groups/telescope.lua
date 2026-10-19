local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		TelescopeNormal = { fg = c.fg, bg = c.surface },
		TelescopePromptNormal = { fg = c.fg, bg = c.surface },
		TelescopeResultsNormal = { fg = c.subtle, bg = c.surface },

		TelescopeSelection = { fg = c.fg, bg = c.highlight_high },
		TelescopeResultsComment = { fg = c.muted },

		TelescopeMatching = { fg = c.match },
		TelescopeResultsIdentifier = { fg = c.fg },

		TelescopePromptBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },
		TelescopeBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },
		TelescopeResultsBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },
		TelescopePreviewBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },

		TelescopeTitle = { fg = c.title, bold = true },
		TelescopePromptTitle = { fg = c.title, bg = c.overlay },
		TelescopeResultsTitle = { fg = c.title, bg = c.overlay },
		TelescopePreviewTitle = { fg = c.title, bg = c.overlay },
	}
end

return M
