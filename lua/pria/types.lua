---@class pria.Palette
---@field blue string
---@field green string
---@field violet string
---@field orange string
---@field yellow string
---@field cyan string
---@field teal string
---@field red string
---@field silver string
---@field fg2 string
---@field fg string
---@field bg string
---@field bg2 string
---@field bg3 string

---@class pria.GitColors
---@field add string
---@field delete string
---@field change string

---@class pria.DiffColors
---@field add string
---@field change string
---@field delete string
---@field text string

---@class pria.DiagnosticColors
---@field error string
---@field warning string
---@field info string
---@field hint string

---@class pria.TerminalColors
---@field black string
---@field red string
---@field green string
---@field orange string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field bright_black string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string

---@class pria.ColorScheme: pria.Palette
---@field none string
---@field success string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field comment string
---@field faint string
---@field selection string
---@field search string
---@field search_bg string
---@field substitute string
---@field match string
---@field title string
---@field git pria.GitColors
---@field diff pria.DiffColors
---@field diagnostic_fg pria.DiagnosticColors
---@field diagnostic_bg pria.DiagnosticColors
---@field terminal? pria.TerminalColors

---@class pria.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias pria.Highlights table<string, pria.Highlight|string>
---@alias pria.HighlightsFn fun(colors: pria.ColorScheme, opts:pria.Config):pria.Highlights

return {}
