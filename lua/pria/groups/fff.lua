local M = {}

M.url = "https://github.com/dmtrKovalenko/fff.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		-- window chrome
		FFFBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },
		FFFNormal = { fg = c.fg, bg = c.surface },
		FFFPrompt = { fg = c.fg, bg = c.surface },
		FFFTitle = { fg = c.title, bold = true },
		FFFCursor = { bg = c.selection },

		-- matched query characters: search color, fg only (no bg block)
		FFFMatch = { fg = c.search, bold = true },

		-- secondary / metadata text
		FFFDir = { fg = c.subtle },
		FFFDebug = { fg = c.subtle },
		FFFFrecency = { fg = c.orange },
		FFFComboHeader = { fg = c.orange },

		-- grep results
		FFFGrepLineNumber = { fg = c.dim },
		FFFGrepRegexActive = { fg = c.info },
		FFFGrepPlainActive = { fg = c.subtle },
		FFFGrepFuzzyActive = { fg = c.hint },

		-- git status
		FFFGitStaged = { fg = c.git.add },
		FFFGitModified = { fg = c.git.change },
		FFFGitDeleted = { fg = c.git.delete },
		FFFGitRenamed = { fg = c.blue },
		FFFGitUntracked = { fg = c.muted },
		FFFGitIgnored = { fg = c.dim },
	}
end

return M
