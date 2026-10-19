set background=dark
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='paradise'
set t_Co=256

" Palette ─────────────────────────────────────────────────────
let s:violet  = "#B895DE"
let s:blue    = "#5AA6E6"
let s:green   = "#5FC878"
let s:orange  = "#ECA25C"
let s:yellow  = "#E4C56B"
let s:teal    = "#5FD3BB"
let s:cyan    = "#A1DEEA"
let s:red     = "#E66B80"

" Foregrounds ─────────────────────────────────────────────────
let s:fg      = "#DCE5E5"
let s:muted   = "#789AA1"
let s:dim     = "#4B5B63"
let s:comment = "#607C85"
let s:subtle  = "#5C6870"

" Backgrounds ─────────────────────────────────────────────────
let s:bg      = "#181A1C"
let s:bg_dim  = "#131416"
let s:surface = "#1E2124"
let s:overlay = "#282B2F"

" Highlight washes ────────────────────────────────────────────
let s:highlight_low  = "#1B1F23"
let s:highlight_med  = "#1F2428"
let s:highlight_high = "#33383D"

" Special ─────────────────────────────────────────────────────
let s:visual    = "#2F2735"
let s:search_bg = "#433B23"

" Diffs ───────────────────────────────────────────────────────
let s:diff_add    = "#1D2F21"
let s:diff_change = "#1E282F"
let s:diff_delete = "#2F1D20"
let s:diff_text   = "#2B4050"

" Diagnostics ─────────────────────────────────────────────────
let s:diag_fg_error   = "#C37A8B"
let s:diag_fg_warning = "#C1B77C"
let s:diag_fg_info    = "#64A2D0"
let s:diag_fg_hint    = "#91C1CB"
let s:diag_bg_error   = "#39272C"
let s:diag_bg_warning = "#393529"
let s:diag_bg_info    = "#23303C"
let s:diag_bg_hint    = "#2D383B"

" Terminal ────────────────────────────────────────────────────
let s:term_black        = s:bg
let s:term_red          = s:red
let s:term_green        = s:green
let s:term_yellow       = s:orange
let s:term_blue         = s:cyan
let s:term_magenta      = s:blue
let s:term_cyan         = s:teal
let s:term_white        = s:fg
let s:term_bright_black = s:highlight_high
let s:term_bright_red   = "#EDABB6"
let s:term_bright_green = "#98D6A7"
let s:term_bright_yellow = "#F0C79F"
let s:term_bright_blue  = "#D5EAEF"
let s:term_bright_magenta = "#9CC7EC"
let s:term_bright_cyan  = "#9BDED0"
let s:term_bright_white = "#F3F6F6"

function! s:hi(group, guisp, guifg, guibg, gui, cterm)
  let cmd = ""
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd = cmd . " gui=" . a:gui
  endif
  if a:cterm != ""
    let cmd = cmd . " cterm=" . a:cterm
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

" Keywords ────────────────────────────────────────────────────
call s:hi("Statement", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Conditional", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Repeat", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Label", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Keyword", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Exception", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Include", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("StorageClass", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Structure", "NONE", s:blue, "NONE", "NONE", "NONE")

" Preprocessor ────────────────────────────────────────────────
call s:hi("PreProc", "NONE", s:violet, "NONE", "NONE", "NONE")
call s:hi("Define", "NONE", s:violet, "NONE", "NONE", "NONE")
call s:hi("Macro", "NONE", s:violet, "NONE", "NONE", "NONE")
call s:hi("PreCondit", "NONE", s:violet, "NONE", "NONE", "NONE")

" Literals ────────────────────────────────────────────────────
call s:hi("String", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Character", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Constant", "NONE", s:fg, "NONE", "NONE", "NONE")
call s:hi("Number", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("Float", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("Boolean", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("Special", "NONE", s:violet, "NONE", "NONE", "NONE")
call s:hi("SpecialChar", "NONE", s:green, "NONE", "NONE", "NONE")

" Identifiers ─────────────────────────────────────────────────
call s:hi("Function", "NONE", s:teal, "NONE", "NONE", "NONE")
call s:hi("Identifier", "NONE", s:fg, "NONE", "NONE", "NONE")

" Types ───────────────────────────────────────────────────────
call s:hi("Type", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Typedef", "NONE", s:cyan, "NONE", "NONE", "NONE")

call s:hi("Operator", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("Delimiter", "NONE", s:muted, "NONE", "NONE", "NONE")

call s:hi("Comment", "NONE", s:comment, "NONE", "NONE", "NONE")
call s:hi("SpecialComment", "NONE", s:comment, "NONE", "NONE", "NONE")

call s:hi("Error", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Debug", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Todo", "NONE", s:cyan, "NONE", "NONE", "NONE")

" UI ──────────────────────────────────────────────────────────
call s:hi("Normal", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("NormalNC", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("NormalSB", "NONE", s:fg, s:bg_dim, "NONE", "NONE")
call s:hi("Conceal", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("NonText", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("SpecialKey", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("Whitespace", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("EndOfBuffer", "NONE", s:dim, "NONE", "NONE", "NONE")

call s:hi("Cursor", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("lCursor", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("CursorIM", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("CursorLine", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("CursorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("ColorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")

call s:hi("LineNr", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("LineNrAbove", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("LineNrBelow", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("CursorLineNr", "NONE", s:fg, "NONE", "bold", "bold")

call s:hi("SignColumn", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("SignColumnSB", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("Folded", "NONE", s:blue, s:highlight_low, "NONE", "NONE")
call s:hi("FoldColumn", "NONE", s:dim, s:bg, "NONE", "NONE")

call s:hi("VertSplit", "NONE", s:overlay, "NONE", "NONE", "NONE")
call s:hi("WinSeparator", "NONE", s:overlay, "NONE", "NONE", "NONE")

call s:hi("NormalFloat", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("FloatBorder", "NONE", s:overlay, s:surface, "NONE", "NONE")
call s:hi("FloatTitle", "NONE", s:cyan, s:overlay, "NONE", "NONE")

" Popup menu ──────────────────────────────────────────────────
call s:hi("Pmenu", "NONE", s:muted, s:surface, "NONE", "NONE")
call s:hi("PmenuSel", "NONE", "NONE", s:highlight_high, "NONE", "NONE")
call s:hi("PmenuSbar", "NONE", "NONE", s:overlay, "NONE", "NONE")
call s:hi("PmenuThumb", "NONE", "NONE", s:muted, "NONE", "NONE")
call s:hi("PmenuMatch", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("PmenuMatchSel", "NONE", s:fg, s:highlight_high, "NONE", "NONE")
call s:hi("WildMenu", "NONE", s:muted, s:surface, "NONE", "NONE")

" Statusline ──────────────────────────────────────────────────
call s:hi("StatusLine", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("StatusLineNC", "NONE", s:dim, s:surface, "NONE", "NONE")
call s:hi("StatusLineTerm", "NONE", s:bg, s:teal, "NONE", "NONE")
call s:hi("StatusLineTermNC", "NONE", s:dim, s:surface, "NONE", "NONE")

" Tabs ────────────────────────────────────────────────────────
call s:hi("TabLine", "NONE", s:dim, s:surface, "NONE", "NONE")
call s:hi("TabLineFill", "NONE", "NONE", s:surface, "NONE", "NONE")
call s:hi("TabLineSel", "NONE", s:cyan, s:bg, "NONE", "NONE")
call s:hi("Title", "NONE", s:cyan, "NONE", "bold", "bold")

" Search ──────────────────────────────────────────────────────
call s:hi("Search", "NONE", s:fg, s:search_bg, "NONE", "NONE")
call s:hi("IncSearch", "NONE", s:bg, s:yellow, "bold", "bold")
call s:hi("CurSearch", "NONE", s:bg, s:yellow, "bold", "bold")
call s:hi("Substitute", "NONE", s:bg, s:orange, "NONE", "NONE")
call s:hi("MatchParen", "NONE", s:yellow, "NONE", "bold,underline", "bold,underline")

" Visual ──────────────────────────────────────────────────────
call s:hi("Visual", "NONE", "NONE", s:visual, "NONE", "NONE")
call s:hi("VisualNOS", "NONE", "NONE", s:visual, "bold", "bold")

" Diffs ───────────────────────────────────────────────────────
call s:hi("DiffAdd", "NONE", "NONE", s:diff_add, "NONE", "NONE")
call s:hi("DiffChange", "NONE", "NONE", s:diff_change, "NONE", "NONE")
call s:hi("DiffDelete", "NONE", s:red, s:diff_delete, "NONE", "NONE")
call s:hi("DiffText", "NONE", "NONE", s:diff_text, "NONE", "NONE")
call s:hi("diffAdded", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("diffRemoved", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("diffChanged", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("diffOldFile", "NONE", s:muted, s:diff_delete, "NONE", "NONE")
call s:hi("diffNewFile", "NONE", s:muted, s:diff_add, "NONE", "NONE")
call s:hi("diffLine", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("diffFile", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("diffIndexLine", "NONE", s:orange, "NONE", "NONE", "NONE")

" Messages ────────────────────────────────────────────────────
call s:hi("ModeMsg", "NONE", s:fg, "NONE", "bold", "bold")
call s:hi("MsgArea", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("MoreMsg", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Question", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("ErrorMsg", "NONE", s:red, "NONE", "bold,italic", "bold,italic")
call s:hi("WarningMsg", "NONE", s:yellow, "NONE", "NONE", "NONE")

" Misc ────────────────────────────────────────────────────────
call s:hi("Directory", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Underlined", "NONE", s:fg, "NONE", "underline", "underline")
call s:hi("Bold", "NONE", s:fg, "NONE", "bold", "bold")
call s:hi("Italic", "NONE", s:fg, "NONE", "italic", "italic")

" QuickFix ────────────────────────────────────────────────────
call s:hi("qfFileName", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("qfLineNr", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("QuickFixLine", "NONE", "NONE", s:highlight_med, "bold", "bold")

" Diagnostics ─────────────────────────────────────────────────
call s:hi("DiagnosticError", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("DiagnosticWarn", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("DiagnosticInfo", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("DiagnosticHint", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("DiagnosticVirtualTextError", "NONE", s:diag_fg_error, s:diag_bg_error, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextWarn", "NONE", s:diag_fg_warning, s:diag_bg_warning, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextInfo", "NONE", s:diag_fg_info, s:diag_bg_info, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextHint", "NONE", s:diag_fg_hint, s:diag_bg_hint, "NONE", "NONE")
call s:hi("DiagnosticUnderlineError", s:red, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineWarn", s:yellow, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineInfo", s:blue, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineHint", s:cyan, "NONE", "NONE", "undercurl", "NONE")

" Health ──────────────────────────────────────────────────────
call s:hi("healthError", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("healthSuccess", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("healthWarning", "NONE", s:yellow, "NONE", "NONE", "NONE")

" WinBar ──────────────────────────────────────────────────────
call s:hi("WinBar", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("WinBarNC", "NONE", s:dim, s:surface, "NONE", "NONE")

hi link Tag Special
hi link Terminal Normal
hi link Ignore Comment

let g:terminal_ansi_colors = [
      \ s:term_black, s:term_red, s:term_green, s:term_yellow,
      \ s:term_blue, s:term_magenta, s:term_cyan, s:term_white,
      \ s:term_bright_black, s:term_bright_red, s:term_bright_green,
      \ s:term_bright_yellow, s:term_bright_blue, s:term_bright_magenta,
      \ s:term_bright_cyan, s:term_bright_white,
      \ ]
