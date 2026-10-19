local M = {}

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		Statement = { fg = c.blue, style = opts.styles.keywords },
		Conditional = { fg = c.blue, style = opts.styles.keywords },
		Repeat = { fg = c.blue, style = opts.styles.keywords },
		Label = { fg = c.blue },
		Keyword = { fg = c.blue, style = opts.styles.keywords },
		Exception = { fg = c.blue, style = opts.styles.keywords },
		PreProc = { fg = c.violet },
		Include = { fg = c.blue, style = opts.styles.keywords },
		StorageClass = { fg = c.blue, style = opts.styles.keywords },
		Structure = { fg = c.blue, style = opts.styles.keywords },

		Define = { fg = c.violet },
		Macro = { fg = c.violet },
		PreCondit = { fg = c.violet },

		String = { fg = c.green },
		Constant = { fg = c.fg },
		Number = { fg = c.orange },
		Float = { fg = c.orange },
		Boolean = { fg = c.orange },
		Character = { fg = c.green },
		Special = { fg = c.violet },
		SpecialChar = { fg = c.green },

		Function = { fg = c.teal, style = opts.styles.functions },
		Identifier = { fg = c.fg },

		Type = { fg = c.cyan, style = opts.styles.types },

		Operator = { fg = c.fg2 },
		Delimiter = { fg = c.fg2 },

		Comment = { fg = c.comment, style = opts.styles.comments },
		SpecialComment = { fg = c.comment, style = opts.styles.comments },

		Error = { fg = c.error },
		Debug = { fg = c.info },
		Todo = { fg = c.hint },

		Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NormalNC = {
			fg = c.fg,
			bg = opts.transparent and c.none or (opts.dim and c.bg2 or c.bg),
		},
		NormalSB = { fg = c.fg, bg = c.bg2 },
		Conceal = { fg = c.faint },
		NonText = { fg = c.faint },
		SpecialKey = { fg = c.faint },
		Whitespace = { fg = c.faint },
		EndOfBuffer = { fg = c.faint },

		Cursor = { bg = c.fg, fg = c.bg },
		lCursor = { bg = c.fg, fg = c.bg },
		CursorIM = { bg = c.fg, fg = c.bg },
		CursorLine = { bg = c.focus },
		CursorColumn = { bg = c.focus },
		ColorColumn = { bg = c.focus },

		LineNr = { fg = c.faint },
		LineNrAbove = { fg = c.faint },
		LineNrBelow = { fg = c.faint },
		CursorLineNr = { fg = c.fg, bold = true },

		SignColumn = { fg = c.faint, bg = c.none },
		SignColumnSB = { fg = c.faint, bg = c.none },
		Folded = { fg = c.blue },
		FoldColumn = { fg = c.faint, bg = opts.transparent and c.none or c.bg },

		VertSplit = { fg = opts.borders and c.border or c.bg },
		WinSeparator = { fg = opts.borders and c.border or c.bg },

		NormalFloat = { fg = c.fg, bg = c.bg2 },
		FloatBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },
		FloatTitle = { fg = c.cyan, bg = c.border },

		Pmenu = { bg = c.bg2, fg = c.fg2 },
		PmenuSel = { bg = c.selection },
		PmenuSbar = { bg = c.border },
		PmenuThumb = { bg = c.fg2 },
		PmenuMatch = { bg = c.bg2, fg = c.fg },
		PmenuMatchSel = { bg = c.selection, fg = c.fg },
		WildMenu = { bg = c.bg2, fg = c.fg2 },

		StatusLine = { fg = c.fg, bg = c.bg2 },
		StatusLineNC = { fg = c.faint, bg = c.bg2 },
		WinBar = "StatusLine",
		WinBarNC = "StatusLineNC",

		TabLine = { bg = opts.transparent and c.none or c.bg2, fg = c.faint },
		TabLineFill = { bg = opts.transparent and c.none or c.bg2 },
		TabLineSel = { fg = c.cyan, bg = opts.transparent and c.none or c.bg },
		Title = { fg = c.cyan, bold = true },

		Search = { bg = c.search_bg, fg = c.fg },
		IncSearch = { bg = c.search, fg = c.bg, bold = true },
		CurSearch = { bg = c.search, fg = c.bg, bold = true },
		Substitute = { bg = c.substitute, fg = c.bg },
		MatchParen = { fg = c.yellow },

		Visual = { bg = c.selection },
		VisualNOS = { bg = c.selection },

		DiffAdd = { bg = c.diff.add },
		DiffChange = { bg = c.diff.change },
		DiffDelete = { bg = c.diff.delete, fg = c.git.delete, nocombine = true },
		DiffText = { bg = c.diff.text },

		diffAdded = { fg = c.git.add },
		diffRemoved = { fg = c.git.delete },
		diffChanged = { fg = c.git.change },
		diffOldFile = { fg = c.fg2, bg = c.diff.delete },
		diffNewFile = { fg = c.fg2, bg = c.diff.add },
		diffLine = { fg = c.fg2 },
		diffFile = { fg = c.cyan },
		diffIndexLine = { fg = c.orange },

		ModeMsg = { fg = c.fg, bold = true },
		MsgArea = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		MoreMsg = { fg = c.info },
		Question = { fg = c.hint },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warning },

		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.hint },
		DiagnosticUnnecessary = { fg = c.faint },
		DiagnosticVirtualTextError = { fg = c.diagnostic_fg.error, bg = c.diagnostic_bg.error },
		DiagnosticVirtualTextWarn = { fg = c.diagnostic_fg.warning, bg = c.diagnostic_bg.warning },
		DiagnosticVirtualTextInfo = { fg = c.diagnostic_fg.info, bg = c.diagnostic_bg.info },
		DiagnosticVirtualTextHint = { fg = c.diagnostic_fg.hint, bg = c.diagnostic_bg.hint },

		DiagnosticUnderlineError = { undercurl = true, sp = c.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },

		LspReferenceText = { bg = c.selection },
		LspReferenceRead = { bg = c.selection },
		LspReferenceWrite = { bg = c.selection },
		LspSignatureActiveParameter = { bg = c.selection, bold = true },
		LspCodeLens = { fg = c.fg2 },
		LspInlayHint = { bg = c.bg2, fg = c.comment },
		LspInfoBorder = { fg = opts.borders and c.border or c.bg2, bg = c.bg2 },

		SpellBad = { sp = c.error, undercurl = true },
		SpellCap = { sp = c.warning, undercurl = true },
		SpellLocal = { sp = c.info, undercurl = true },
		SpellRare = { sp = c.hint, undercurl = true },

		qfFileName = { fg = c.cyan },
		qfLineNr = { fg = c.faint },
		QuickFixLine = { bg = c.bg2, bold = true },

		Directory = { fg = c.cyan },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		healthError = { fg = c.error },
		healthSuccess = { fg = c.success },
		healthWarning = { fg = c.warning },

		helpExample = { fg = c.fg2 },
		helpCommand = { fg = c.green },
		ComplHint = { fg = c.fg2 },
		debugPC = { bg = c.border },
		debugBreakpoint = { fg = c.error },

		RedrawDebugClear = { fg = c.bg, bg = c.orange },
		RedrawDebugComposed = { fg = c.bg, bg = c.teal },
		RedrawDebugRecompose = { fg = c.bg, bg = c.red },
		StatusLineTerm = { fg = c.bg, bg = c.teal },
		StatusLineTermNC = { fg = c.faint, bg = c.bg2 },
		NvimInternalError = { fg = c.error },
		LspCodeLensSeparator = { fg = c.faint },
		Added = { fg = c.git.add },
		Changed = { fg = c.git.change },
		Removed = { fg = c.git.delete },
		PmenuExtra = { fg = c.fg2, bg = c.bg2 },
		PmenuExtraSel = { fg = c.fg2, bg = c.selection },
		PmenuKind = { fg = c.cyan, bg = c.bg2 },
		PmenuKindSel = { fg = c.cyan, bg = c.selection },
	}
end

return M
