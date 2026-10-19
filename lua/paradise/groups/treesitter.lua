local M = {}

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		["@comment"] = "Comment",
		["@comment.nospell"] = { fg = c.comment, style = opts.styles.comments },
		["@comment.error"] = { fg = c.error },
		["@comment.warning"] = { fg = c.warning },
		["@comment.info"] = { fg = c.info },
		["@comment.hint"] = { fg = c.hint },
		["@comment.note"] = { fg = c.hint },
		["@comment.todo"] = { fg = c.hint },

		["@string"] = "String",
		["@string.documentation"] = "@string",
		["@string.regexp"] = { fg = c.green },
		["@string.escape"] = { fg = c.violet },

		["@character"] = "Character",
		["@character.printf"] = "@character",
		["@character.special"] = "@character",

		["@constant"] = "Constant",
		["@constant.builtin"] = { fg = c.orange },
		["@constant.macro"] = "@constant",
		["@constant.regexp"] = "@constant",

		["@number"] = "Number",
		["@number.float"] = "Float",
		["@boolean"] = "Boolean",

		["@keyword"] = "Keyword",
		["@keyword.return"] = "@keyword",
		["@keyword.function"] = "@keyword",
		["@keyword.import"] = "@keyword",
		["@keyword.coroutine"] = "@keyword",
		["@keyword.operator"] = { fg = c.muted },

		["@keyword.conditional"] = "@keyword",
		["@keyword.repeat"] = "Repeat",
		["@keyword.exception"] = "Exception",
		["@keyword.debug"] = "Debug",
		["@keyword.storage"] = "StorageClass",
		["@keyword.directive.define"] = "Define",
		["@keyword.directive"] = "PreCondit",

		["@type.qualifier"] = "@keyword",
		["@label"] = "Label",

		["@function"] = "Function",
		["@function.call"] = "@function",
		["@function.builtin"] = "@function",
		["@function.method"] = "@function",
		["@function.method.call"] = "@function",
		["@function.macro"] = "@function",

		["@constructor"] = "Function",

		["@attribute"] = "PreProc",
		["@attribute.builtin"] = "@attribute",
		["@annotation"] = "PreProc",

		["@type"] = "Type",
		["@type.builtin"] = "@type",
		["@type.definition"] = "@type",

		["@property"] = { fg = c.attribute },

		["@tag"] = { fg = c.cyan },
		["@tag.builtin"] = "@tag",
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.delimiter"] = "Delimiter",

		["@variable"] = { fg = c.fg },
		["@variable.member"] = { fg = c.attribute },
		["@variable.parameter"] = "@variable",
		["@variable.parameter.builtin"] = "@variable",
		["@variable.builtin"] = { fg = c.fg, style = opts.styles.builtins },

		["@module"] = { fg = c.fg },
		["@module.builtin"] = { fg = c.fg },
		["@namespace.builtin"] = "@variable.builtin",

		["@identifier"] = "Identifier",

		["@operator"] = "Operator",

		["@punctuation.delimiter"] = "Delimiter",
		["@punctuation.bracket"] = "Delimiter",
		["@punctuation.special"] = { fg = c.violet },
		["@punctuation.bracket.regexp"] = "Delimiter",
		["@punctuation.special.markdown"] = { fg = c.muted },

		["@none"] = {},
		["@markup"] = "@none",

		["@markup.heading"] = "Title",

		["@markup.heading.1.markdown"] = { fg = c.blue },
		["@markup.heading.2.markdown"] = { fg = c.cyan },
		["@markup.heading.3.markdown"] = { fg = c.teal },
		["@markup.heading.4.markdown"] = { fg = c.green },
		["@markup.heading.5.markdown"] = { fg = c.orange },
		["@markup.heading.6.markdown"] = { fg = c.violet },

		["@markup.link"] = { fg = c.dim },
		["@markup.link.label"] = { fg = c.cyan },
		["@markup.link.label.symbol"] = { fg = c.cyan },
		["@markup.link.url"] = { fg = c.orange, underline = true },

		["@markup.list"] = { fg = c.blue },
		["@markup.list.markdown"] = { fg = c.blue, bold = true },
		["@markup.list.checked"] = { fg = c.fg },
		["@markup.list.unchecked"] = { fg = c.dim },

		["@markup.raw"] = "String",
		["@markup.raw.markdown_inline"] = "@markup.raw",
		["@label.markdown"] = "@markup.raw",

		["@markup.italic"] = { italic = true },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strikethrough"] = { strikethrough = true },

		["@markup.environment"] = "Macro",
		["@markup.environment.name"] = "Type",
		["@markup.math"] = "Special",

		["@diff.plus"] = "DiffAdd",
		["@diff.minus"] = "DiffDelete",
		["@diff.delta"] = "DiffChange",

		["@tag.javascript"] = "@tag",

		["@attribute.diff"] = { fg = c.orange },
		["@parameter"] = { fg = c.fg },
		["@punctuation"] = { fg = c.muted },
		["@regexp"] = "String",
		["@symbol"] = "Identifier",
		["@text"] = { fg = c.fg },
		["@text.danger"] = { fg = c.error },
		["@text.diff.add"] = { fg = c.green, bg = c.diff.add, blend = 20 },
		["@text.diff.delete"] = { fg = c.red, bg = c.diff.delete, blend = 20 },
		["@text.emphasis"] = { italic = true },
		["@text.environment"] = "Macro",
		["@text.environment.name"] = "Type",
		["@text.math"] = "Special",
		["@text.note"] = "SpecialComment",
		["@text.strike"] = { strikethrough = true },
		["@text.strong"] = { bold = true },
		["@text.title"] = "Title",
		["@text.underline"] = { underline = true },
		["@text.uri"] = { fg = c.orange, underline = true },
		["@text.warning"] = { fg = c.warning },

		["@string.special"] = "String",
		["@string.special.symbol"] = "Identifier",
		["@string.special.url"] = { fg = c.orange, underline = true },
		["@float"] = "Number",
		["@keyword.conditional.ternary"] = "@keyword",
		["@conceal"] = "Conceal",
		["@conceal.markdown"] = { fg = c.muted },
		["@markup.quote"] = { fg = c.fg },
		["@markup.raw.delimiter.markdown"] = { fg = c.muted },

		["@tag.attribute.tsx"] = "@tag.attribute",
		["@tag.delimiter.tsx"] = "@tag.delimiter",
		["@tag.tsx"] = "@tag",

		["@property.tsx"] = "@property",
		["@property.jsx"] = "@property",

		["@function.call.tsx"] = "@function.call",
		["@function.call.jsx"] = "@function.call",

		["@constructor.jsx"] = "@constructor",
		["@constructor.tsx"] = "@constructor",

		["@variable.parameter.tsx"] = "@variable.parameter",

		htmlArg = { fg = c.attribute },
		htmlBold = { bold = true },
		htmlEndTag = { fg = c.muted },
		htmlH1 = "Title",
		htmlH2 = "Title",
		htmlH3 = "Title",
		htmlH4 = "Title",
		htmlH5 = "Title",
		htmlItalic = { italic = true },
		htmlLink = "Underlined",
		htmlTag = { fg = c.muted },
		htmlTagN = { fg = c.fg },
		htmlTagName = { fg = c.cyan },
		tsxAttrib = { fg = c.attribute },
	}
end

return M
