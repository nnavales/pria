local M = {}

M.url = "https://github.com/dmtrKovalenko/fff.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		-- window chrome
		FFFBorder = { fg = opts.borders and c.bg3 or c.bg2, bg = c.bg2 },
		FFFNormal = { fg = c.fg, bg = c.bg2 },
		FFFPrompt = { fg = c.fg, bg = c.bg2 },
		FFFTitle = { fg = c.title },
		FFFCursor = { bg = c.selection },

		-- matched query characters: search color, fg only (no bg block)
		FFFMatch = { fg = c.search },

		-- secondary / metadata text
		FFFDir = { fg = c.fg2 },
		FFFDebug = { fg = c.fg2 },
		FFFFrecency = { fg = c.rose },
		FFFComboHeader = { fg = c.title },

		-- grep results
		FFFGrepLineNumber = { fg = c.faint },
		FFFGrepRegexActive = { fg = c.info },
		FFFGrepPlainActive = { fg = c.fg2 },
		FFFGrepFuzzyActive = { fg = c.hint },

		-- git status
		FFFGitStaged = { fg = c.git.add },
		FFFGitModified = { fg = c.git.change },
		FFFGitDeleted = { fg = c.git.delete },
		FFFGitRenamed = { fg = c.blue },
		FFFGitUntracked = { fg = c.fg2 },
		FFFGitIgnored = { fg = c.faint },
	}
end

return M
