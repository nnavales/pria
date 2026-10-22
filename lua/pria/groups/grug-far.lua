local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		GrugFarHelpHeader = { fg = c.fg2 },
		GrugFarHelpHeaderKey = { fg = c.sky, bold = true },

		GrugFarInputLabel = { fg = c.sky, bold = true },
		GrugFarInputPlaceholder = { fg = c.faint },

		GrugFarResultsHeader = { fg = c.title },
		GrugFarResultsStats = { fg = c.info },
		GrugFarResultsLineNo = { fg = c.faint },
		GrugFarResultsLineColumn = { fg = c.fg2 },
		GrugFarResultsChangeIndicator = { fg = c.git.change },

		GrugFarResultsMatch = { fg = c.bg, bg = c.search, bold = true },
		GrugFarResultsMatchIndicator = { fg = c.search, bold = true },

		GrugFarResultsActionIndicator = { fg = c.warning },
		GrugFarResultsRemoveIndicator = { fg = c.error },
		GrugFarResultsAddIndicator = { fg = c.git.add },

		GrugFarStatusProgress = { fg = c.info },
		GrugFarStatusSuccess = { fg = c.success },
		GrugFarStatusError = { fg = c.error },

		GrugFarBufferHeader = { fg = c.title },
		GrugFarBufferSpinner = { fg = c.sky },
		GrugFarBufferSearchPrefix = { fg = c.fg2 },
	}
end

return M
