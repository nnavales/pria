local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		SnacksDashboardDesc = { fg = c.fg },
		SnacksDashboardFooter = { fg = c.faint },
		SnacksDashboardHeader = { fg = c.faint, bold = true },
		SnacksDashboardIcon = { fg = c.fg },
		SnacksDashboardKey = { fg = c.fg },
		SnacksDashboardSpecial = { fg = c.fg },
		SnacksDashboardDir = { fg = c.fg },

		SnacksNotifierDebug = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierBorderDebug = { fg = c.fg2, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierIconDebug = { fg = c.fg2 },
		SnacksNotifierTitleDebug = { fg = c.fg2 },

		SnacksNotifierError = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierBorderError = { fg = c.error, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierIconError = { fg = c.error },
		SnacksNotifierTitleError = { fg = c.error },

		SnacksNotifierInfo = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierBorderInfo = { fg = c.info, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierIconInfo = { fg = c.info },
		SnacksNotifierTitleInfo = { fg = c.info },

		SnacksNotifierTrace = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierBorderTrace = { fg = c.fg2, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierIconTrace = { fg = c.fg2 },
		SnacksNotifierTitleTrace = { fg = c.fg2 },
		SnacksNormal = { fg = c.fg, bg = c.bg },

		SnacksNotifierWarn = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierBorderWarn = { fg = c.warning, bg = opts.transparent and c.none or c.bg },
		SnacksNotifierIconWarn = { fg = c.warning },
		SnacksNotifierTitleWarn = { fg = c.warning },

		SnacksNotifierHistory = { fg = c.fg, bg = c.bg2 },
		SnacksNotifierBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		SnacksNotifierTitle = { fg = c.title, bg = c.border, bold = true },

		SnacksProfilerIconInfo = { bg = c.bg2, fg = c.cyan },
		SnacksProfilerBadgeInfo = { bg = c.focus, fg = c.cyan },
		SnacksFooterKey = "SnacksProfilerIconInfo",
		SnacksFooterDesc = "SnacksProfilerBadgeInfo",
		SnacksProfilerIconTrace = { bg = c.bg2, fg = c.faint },
		SnacksProfilerBadgeTrace = { bg = c.focus, fg = c.faint },

		SnacksIndent = { fg = c.fg2, nocombine = true },
		SnacksIndentScope = { fg = c.cyan, nocombine = true },

		SnacksZenIcon = { fg = c.blue },
		SnacksInputIcon = { fg = c.cyan },
		SnacksInputBorder = { fg = opts.borders and c.border or c.bg2 },
		SnacksInputTitle = { fg = c.title, bold = true },

		SnacksPickerInput = { fg = c.fg, bg = c.bg2 },
		SnacksPickerInputBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		SnacksPickerInputTitle = { fg = c.title, bg = c.border, bold = true },
		SnacksPickerBoxTitle = { fg = c.title, bg = c.border, bold = true },
		SnacksPickerSelected = { fg = c.fg, bg = c.selection, bold = true },
		SnacksPickerToggle = { bg = c.focus, fg = c.cyan },
		SnacksPickerPickWinCurrent = { fg = c.fg, bg = c.blue, bold = true },
		SnacksPickerPickWin = { fg = c.fg, bg = c.bg2, bold = true },

		SnacksGhLabel = { fg = c.cyan, bold = true },
		SnacksGhDiffHeader = { bg = c.focus, fg = c.cyan },

		SnacksIndent1 = { fg = c.blue, nocombine = true },
		SnacksIndent2 = { fg = c.cyan, nocombine = true },
		SnacksIndent3 = { fg = c.teal, nocombine = true },
		SnacksIndent4 = { fg = c.green, nocombine = true },
		SnacksIndent5 = { fg = c.orange, nocombine = true },
		SnacksIndent6 = { fg = c.violet, nocombine = true },
		SnacksIndent7 = { fg = c.red, nocombine = true },
		SnacksIndent8 = { fg = c.fg, nocombine = true },

		SnacksNotifierHistoryTitle = { fg = c.fg, bold = true },
		SnacksNotifierHistoryDateTime = { fg = c.faint },
		SnacksNotifierMinimal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
	}
end

return M
