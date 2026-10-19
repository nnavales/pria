local M = {}

M.url = "https://github.com/NeogitOrg/neogit"

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		NeogitBranch = { fg = c.git.delete, bold = true },
		NeogitBranchHead = { fg = c.git.delete, bold = true },
		NeogitRemote = { fg = c.cyan },
		NeogitRemoteBranch = { fg = c.cyan },
		NeogitRemoteBranchHead = { fg = c.cyan, bold = true },

		NeogitHEAD = { fg = c.orange, bold = true },
		NeogitHEADLabel = { fg = c.orange, bold = true },
		NeogitTag = { fg = c.violet },
		NeogitTagName = { fg = c.violet },
		NeogitTagDistance = { fg = c.dim },

		NeogitCommitViewHeader = { fg = c.green, bold = true },
		NeogitObjectId = { fg = c.dim },
		NeogitCommitMessage = { fg = c.fg },
		NeogitCommitMessageHighlight = { fg = c.fg, bold = true },

		NeogitSectionHeader = { fg = c.green, bold = true },
		NeogitSectionHeaderCount = { fg = c.green },

		NeogitChangeAdded = { fg = c.git.add },
		NeogitChangeModified = { fg = c.git.change },
		NeogitChangeDeleted = { fg = c.git.delete },
		NeogitChangeRenamed = { fg = c.blue },
		NeogitChangeUpdated = { fg = c.warning },
		NeogitChangeCopied = { fg = c.teal },

		NeogitDiffContext = { fg = c.dim },
		NeogitDiffContextHighlight = { bg = c.highlight_low, fg = c.fg },

		NeogitHunkHeader = { bg = c.surface, fg = c.dim },
		NeogitHunkHeaderHighlight = { bg = c.highlight_med, fg = c.cyan, bold = true },
		NeogitHunkHeaderCursor = { bg = c.highlight_high, fg = c.cyan, bold = true },

		NeogitStaged = { fg = c.git.add, bold = true },
		NeogitUnstaged = { fg = c.warning, bold = true },
		NeogitUntracked = { fg = c.muted },
		NeogitConflict = { fg = c.error, bold = true },
		NeogitUnmergedInto = { fg = c.error },
		NeogitUnpulledFrom = { fg = c.hint },
		NeogitRebasing = { fg = c.warning, bold = true },
		NeogitPicking = { fg = c.warning, bold = true },
		NeogitReverting = { fg = c.warning, bold = true },

		NeogitCommandText = { fg = c.fg },
		NeogitCommandCodeNormal = { fg = c.green },
		NeogitCommandCodeError = { fg = c.error },
		NeogitCommandTime = { fg = c.dim },
		NeogitLogViewHeader = { fg = c.green, bold = true },

		NeogitNotificationInfo = { fg = c.info },
		NeogitNotificationWarning = { fg = c.warning },
		NeogitNotificationError = { fg = c.error },

		NeogitPopupSectionTitle = { fg = c.green, bold = true },
		NeogitPopupSwitchKey = { fg = c.orange },
		NeogitPopupSwitchEnabled = { fg = c.green },
		NeogitPopupSwitchDisabled = { fg = c.dim },
		NeogitPopupOptionKey = { fg = c.violet },
		NeogitPopupOptionEnabled = { fg = c.green },
		NeogitPopupOptionDisabled = { fg = c.dim },
		NeogitPopupActionKey = { fg = c.cyan },
		NeogitPopupActionDisabled = { fg = c.dim },
		NeogitPopupActionHighlight = { fg = c.blue, bold = true },
		NeogitPopupConfigKey = { fg = c.teal },
		NeogitPopupConfigEnabled = { fg = c.green },
		NeogitPopupConfigDisabled = { fg = c.dim },

		NeogitGraphRed = { fg = c.error },
		NeogitGraphGreen = { fg = c.git.add },
		NeogitGraphYellow = { fg = c.yellow },
		NeogitGraphBlue = { fg = c.blue },
		NeogitGraphPurple = { fg = c.violet },
		NeogitGraphCyan = { fg = c.cyan },
		NeogitGraphWhite = { fg = c.fg },
		NeogitGraphGray = { fg = c.dim },
		NeogitGraphBoldRed = { fg = c.error, bold = true },
		NeogitGraphBoldGreen = { fg = c.git.add, bold = true },
		NeogitGraphBoldYellow = { fg = c.yellow, bold = true },
		NeogitGraphBoldBlue = { fg = c.blue, bold = true },
		NeogitGraphBoldPurple = { fg = c.violet, bold = true },
		NeogitGraphBoldCyan = { fg = c.cyan, bold = true },
		NeogitGraphBoldWhite = { fg = c.fg, bold = true },

		NeogitFloatHeader = { bg = c.surface, fg = c.fg, bold = true },
		NeogitFloatHeaderHighlight = { bg = c.highlight_med, fg = c.cyan, bold = true },
		NeogitFloatFooter = { bg = c.surface, fg = c.dim },
		NeogitCommitSelectAction = { fg = c.orange, bold = true },
		NeogitCommitViewDescription = { fg = c.dim, italic = true },
		NeogitRebaseDone = { fg = c.muted },
	}
end

return M
