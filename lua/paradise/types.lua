---@class paradise.Palette
---@field blue string
---@field green string
---@field violet string
---@field orange string
---@field yellow string
---@field cyan string
---@field teal string
---@field red string
---@field attribute string
---@field muted string
---@field fg string
---@field dim string
---@field bg string
---@field bg_dim string
---@field surface string
---@field overlay string
---@field highlight_low string
---@field highlight_med string
---@field highlight_high string

---@class paradise.GitColors
---@field add string
---@field delete string
---@field change string

---@class paradise.DiffColors
---@field add string
---@field change string
---@field delete string
---@field text string

---@class paradise.DiagnosticColors
---@field error string
---@field warning string
---@field info string
---@field hint string

---@class paradise.TerminalColors
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

---@class paradise.ColorScheme: paradise.Palette
---@field none string
---@field success string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field subtle string
---@field search string
---@field search_bg string
---@field substitute string
---@field match string
---@field title string
---@field git paradise.GitColors
---@field diff paradise.DiffColors
---@field diagnostic_fg paradise.DiagnosticColors
---@field diagnostic_bg paradise.DiagnosticColors
---@field terminal? paradise.TerminalColors

---@class paradise.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias paradise.Highlights table<string, paradise.Highlight|string>
---@alias paradise.HighlightsFn fun(colors: paradise.ColorScheme, opts:paradise.Config):paradise.Highlights

return {}
