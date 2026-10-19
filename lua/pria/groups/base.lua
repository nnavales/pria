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

		Operator = { fg = c.muted },
		Delimiter = { fg = c.muted },

		Comment = { fg = c.comment, style = opts.styles.comments },
		SpecialComment = { fg = c.comment, style = opts.styles.comments },

		Error = { fg = c.error },
		Debug = { fg = c.info },
		Todo = { fg = c.hint },

		Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NormalNC = {
			fg = c.fg,
			bg = opts.transparent and c.none or (opts.dim and c.bg_dim or c.bg),
		},
		NormalSB = { fg = c.fg, bg = c.bg_dim },
		Conceal = { fg = c.dim },
		NonText = { fg = c.dim },
		SpecialKey = { fg = c.dim },
		Whitespace = { fg = c.dim },
		EndOfBuffer = { fg = c.dim },

		Cursor = { bg = c.fg, fg = c.bg },
		lCursor = { bg = c.fg, fg = c.bg },
		CursorIM = { bg = c.fg, fg = c.bg },
		CursorLine = { bg = c.highlight_low },
		CursorColumn = { bg = c.highlight_low },
		ColorColumn = { bg = c.highlight_low },

		LineNr = { fg = c.dim },
		LineNrAbove = { fg = c.dim },
		LineNrBelow = { fg = c.dim },
		CursorLineNr = { fg = c.fg, bold = true },

		SignColumn = { fg = c.dim, bg = c.none },
		SignColumnSB = { fg = c.dim, bg = c.none },
		Folded = { fg = c.blue, bg = opts.transparent and c.none or c.highlight_low },
		FoldColumn = { fg = c.dim, bg = opts.transparent and c.none or c.bg },

		VertSplit = { fg = opts.borders and c.overlay or c.bg },
		WinSeparator = { fg = opts.borders and c.overlay or c.bg },

		NormalFloat = { fg = c.fg, bg = c.surface },
		FloatBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },
		FloatTitle = { fg = c.cyan, bg = c.overlay },

		Pmenu = { bg = c.surface, fg = c.muted },
		PmenuSel = { bg = c.selection },
		PmenuSbar = { bg = c.overlay },
		PmenuThumb = { bg = c.muted },
		PmenuMatch = { bg = c.surface, fg = c.fg },
		PmenuMatchSel = { bg = c.selection, fg = c.fg },
		WildMenu = { bg = c.surface, fg = c.muted },

		StatusLine = { fg = c.fg, bg = c.surface },
		StatusLineNC = { fg = c.dim, bg = c.surface },
		WinBar = "StatusLine",
		WinBarNC = "StatusLineNC",

		TabLine = { bg = opts.transparent and c.none or c.surface, fg = c.dim },
		TabLineFill = { bg = opts.transparent and c.none or c.surface },
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
		diffOldFile = { fg = c.muted, bg = c.diff.delete },
		diffNewFile = { fg = c.muted, bg = c.diff.add },
		diffLine = { fg = c.muted },
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
		DiagnosticUnnecessary = { fg = c.dim },
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
		LspCodeLens = { fg = c.muted },
		LspInlayHint = { bg = c.surface, fg = c.comment },
		LspInfoBorder = { fg = opts.borders and c.overlay or c.surface, bg = c.surface },

		SpellBad = { sp = c.error, undercurl = true },
		SpellCap = { sp = c.warning, undercurl = true },
		SpellLocal = { sp = c.info, undercurl = true },
		SpellRare = { sp = c.hint, undercurl = true },

		qfFileName = { fg = c.cyan },
		qfLineNr = { fg = c.dim },
		QuickFixLine = { bg = c.surface, bold = true },

		Directory = { fg = c.cyan },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		healthError = { fg = c.error },
		healthSuccess = { fg = c.success },
		healthWarning = { fg = c.warning },

		helpExample = { fg = c.muted },
		helpCommand = { fg = c.green },
		ComplHint = { fg = c.muted },
		debugPC = { bg = c.overlay },
		debugBreakpoint = { fg = c.error },

		RedrawDebugClear = { fg = c.bg, bg = c.orange },
		RedrawDebugComposed = { fg = c.bg, bg = c.teal },
		RedrawDebugRecompose = { fg = c.bg, bg = c.red },
		StatusLineTerm = { fg = c.bg, bg = c.teal },
		StatusLineTermNC = { fg = c.dim, bg = c.surface },
		NvimInternalError = { fg = c.error },
		LspCodeLensSeparator = { fg = c.dim },
		Added = { fg = c.git.add },
		Changed = { fg = c.git.change },
		Removed = { fg = c.git.delete },
		PmenuExtra = { fg = c.muted, bg = c.surface },
		PmenuExtraSel = { fg = c.muted, bg = c.selection },
		PmenuKind = { fg = c.cyan, bg = c.surface },
		PmenuKindSel = { fg = c.cyan, bg = c.selection },
	}
end

return M
