local M = {}

M.url = "https://github.com/NeogitOrg/neogit"

---@type pria.HighlightsFn
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
		NeogitTagDistance = { fg = c.faint },

		NeogitCommitViewHeader = { fg = c.green, bold = true },
		NeogitObjectId = { fg = c.faint },
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

		NeogitDiffContext = { fg = c.faint },
		NeogitDiffContextHighlight = { bg = c.current, fg = c.fg },

		NeogitHunkHeader = { bg = c.bg2, fg = c.faint },
		NeogitHunkHeaderHighlight = { bg = c.bg2, fg = c.cyan, bold = true },
		NeogitHunkHeaderCursor = { bg = c.selection, fg = c.cyan, bold = true },

		NeogitStaged = { fg = c.git.add, bold = true },
		NeogitUnstaged = { fg = c.warning, bold = true },
		NeogitUntracked = { fg = c.fg2 },
		NeogitConflict = { fg = c.error, bold = true },
		NeogitUnmergedInto = { fg = c.error },
		NeogitUnpulledFrom = { fg = c.hint },
		NeogitRebasing = { fg = c.warning, bold = true },
		NeogitPicking = { fg = c.warning, bold = true },
		NeogitReverting = { fg = c.warning, bold = true },

		NeogitCommandText = { fg = c.fg },
		NeogitCommandCodeNormal = { fg = c.green },
		NeogitCommandCodeError = { fg = c.error },
		NeogitCommandTime = { fg = c.faint },
		NeogitLogViewHeader = { fg = c.green, bold = true },

		NeogitNotificationInfo = { fg = c.info },
		NeogitNotificationWarning = { fg = c.warning },
		NeogitNotificationError = { fg = c.error },

		NeogitPopupSectionTitle = { fg = c.green, bold = true },
		NeogitPopupSwitchKey = { fg = c.orange },
		NeogitPopupSwitchEnabled = { fg = c.green },
		NeogitPopupSwitchDisabled = { fg = c.faint },
		NeogitPopupOptionKey = { fg = c.violet },
		NeogitPopupOptionEnabled = { fg = c.green },
		NeogitPopupOptionDisabled = { fg = c.faint },
		NeogitPopupActionKey = { fg = c.cyan },
		NeogitPopupActionDisabled = { fg = c.faint },
		NeogitPopupActionHighlight = { fg = c.blue, bold = true },
		NeogitPopupConfigKey = { fg = c.teal },
		NeogitPopupConfigEnabled = { fg = c.green },
		NeogitPopupConfigDisabled = { fg = c.faint },

		NeogitGraphRed = { fg = c.error },
		NeogitGraphGreen = { fg = c.git.add },
		NeogitGraphYellow = { fg = c.yellow },
		NeogitGraphBlue = { fg = c.blue },
		NeogitGraphPurple = { fg = c.violet },
		NeogitGraphCyan = { fg = c.cyan },
		NeogitGraphWhite = { fg = c.fg },
		NeogitGraphGray = { fg = c.faint },
		NeogitGraphBoldRed = { fg = c.error, bold = true },
		NeogitGraphBoldGreen = { fg = c.git.add, bold = true },
		NeogitGraphBoldYellow = { fg = c.yellow, bold = true },
		NeogitGraphBoldBlue = { fg = c.blue, bold = true },
		NeogitGraphBoldPurple = { fg = c.violet, bold = true },
		NeogitGraphBoldCyan = { fg = c.cyan, bold = true },
		NeogitGraphBoldWhite = { fg = c.fg, bold = true },

		NeogitFloatHeader = { bg = c.bg2, fg = c.fg, bold = true },
		NeogitFloatHeaderHighlight = { bg = c.bg2, fg = c.cyan, bold = true },
		NeogitFloatFooter = { bg = c.bg2, fg = c.faint },
		NeogitCommitSelectAction = { fg = c.orange, bold = true },
		NeogitCommitViewDescription = { fg = c.faint, italic = true },
		NeogitRebaseDone = { fg = c.fg2 },
	}
end

return M
