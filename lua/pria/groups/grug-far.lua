local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		GrugFarHelpHeader = { fg = c.muted },
		GrugFarHelpHeaderKey = { fg = c.cyan, bold = true },

		GrugFarInputLabel = { fg = c.cyan, bold = true },
		GrugFarInputPlaceholder = { fg = c.dim },

		GrugFarResultsHeader = { fg = c.violet, bold = true },
		GrugFarResultsStats = { fg = c.info },
		GrugFarResultsLineNo = { fg = c.dim },
		GrugFarResultsLineColumn = { fg = c.muted },
		GrugFarResultsChangeIndicator = { fg = c.git.change },

		GrugFarResultsMatch = { fg = c.bg, bg = c.search, bold = true },
		GrugFarResultsMatchIndicator = { fg = c.search, bold = true },

		GrugFarResultsActionIndicator = { fg = c.warning },
		GrugFarResultsRemoveIndicator = { fg = c.error },
		GrugFarResultsAddIndicator = { fg = c.git.add },

		GrugFarStatusProgress = { fg = c.info },
		GrugFarStatusSuccess = { fg = c.success },
		GrugFarStatusError = { fg = c.error },

		GrugFarBufferHeader = { fg = c.cyan, bold = true },
		GrugFarBufferSpinner = { fg = c.cyan },
		GrugFarBufferSearchPrefix = { fg = c.muted },
	}
end

return M
