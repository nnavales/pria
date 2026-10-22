set background=dark
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='pria'
set t_Co=256
if has('termguicolors')
    set termguicolors
endif

" Palette ─────────────────────────────────────────────────────
let s:rose    = "#F7ABD1"
let s:blue    = "#79BCF6"
let s:sky     = "#ACEAFE"
let s:cyan    = "#34DACA"
let s:green   = "#89E28D"
let s:lilac   = "#BFBAFA"
let s:silver  = "#A8BEC2"

let s:yellow  = "#E3B341"
let s:red     = "#FF7A7A"

" Foregrounds ─────────────────────────────────────────────────
let s:fg        = "#D3D9DA"
let s:muted     = "#8A9698"
let s:dim       = "#464D4F"
let s:comment   = "#798486"
let s:structure = "#97ADB1"

" Backgrounds ─────────────────────────────────────────────────
let s:bg      = "#212527"
let s:bg_dim  = "#1C1F21"
let s:surface = "#1C1F21"
let s:overlay = "#2A2F32"

" Highlight washes ────────────────────────────────────────────
let s:highlight_low  = s:overlay
let s:highlight_med  = s:overlay
let s:highlight_high = s:overlay

" Special ─────────────────────────────────────────────────────
let s:visual    = "#394B5B"
let s:search    = "#BFBAFA"
let s:search_bg = "#343740"

" Diffs ───────────────────────────────────────────────────────
let s:diff_add    = "#313F37"
let s:diff_change = "#2E3A44"
let s:diff_delete = "#413334"
let s:diff_text   = "#33434F"

" Diagnostics ─────────────────────────────────────────────────
let s:diag_fg_error   = "#E9A8A6"
let s:diag_fg_warning = "#D8C495"
let s:diag_fg_info    = "#A7C7E4"
let s:diag_fg_hint    = "#C3E2EC"
let s:diag_bg_error   = "#463535"
let s:diag_bg_warning = "#403C30"
let s:diag_bg_info    = "#303D48"
let s:diag_bg_hint    = "#374448"

" Terminal ────────────────────────────────────────────────────
let s:term_black         = s:bg
let s:term_red           = s:red
let s:term_green         = s:green
let s:term_yellow        = s:yellow
let s:term_blue          = s:blue
let s:term_magenta       = s:lilac
let s:term_cyan          = s:cyan
let s:term_white         = s:fg
let s:term_bright_black   = "#35393B"
let s:term_bright_red     = "#FFA7A4"
let s:term_bright_green   = "#A3FDA6"
let s:term_bright_yellow  = "#FECD5E"
let s:term_bright_blue    = "#A5D5FF"
let s:term_bright_magenta = "#DAD8FF"
let s:term_bright_cyan    = "#5AF5E4"
let s:term_bright_white   = "#EDF3F4"

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
    silent! exec "hi clear " . a:group
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
call s:hi("PreProc", "NONE", s:lilac, "NONE", "NONE", "NONE")
call s:hi("Define", "NONE", s:lilac, "NONE", "NONE", "NONE")
call s:hi("Macro", "NONE", s:lilac, "NONE", "NONE", "NONE")
call s:hi("PreCondit", "NONE", s:lilac, "NONE", "NONE", "NONE")

" Literals ────────────────────────────────────────────────────
call s:hi("String", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Character", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Constant", "NONE", s:fg, "NONE", "NONE", "NONE")
call s:hi("Number", "NONE", s:rose, "NONE", "NONE", "NONE")
call s:hi("Integer", "NONE", s:rose, "NONE", "NONE", "NONE")
call s:hi("Float", "NONE", s:rose, "NONE", "NONE", "NONE")
call s:hi("Boolean", "NONE", s:rose, "NONE", "NONE", "NONE")
call s:hi("Special", "NONE", s:lilac, "NONE", "NONE", "NONE")
call s:hi("SpecialChar", "NONE", s:green, "NONE", "NONE", "NONE")

" Identifiers ─────────────────────────────────────────────────
call s:hi("Function", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Identifier", "NONE", s:fg, "NONE", "NONE", "NONE")

" Types ───────────────────────────────────────────────────────
call s:hi("Type", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("Typedef", "NONE", s:sky, "NONE", "NONE", "NONE")

call s:hi("Operator", "NONE", s:structure, "NONE", "NONE", "NONE")
call s:hi("Delimiter", "NONE", s:structure, "NONE", "NONE", "NONE")

call s:hi("Comment", "NONE", s:comment, "NONE", "italic", "italic")
call s:hi("SpecialComment", "NONE", s:comment, "NONE", "italic", "italic")

call s:hi("Error", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Debug", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Todo", "NONE", s:sky, "NONE", "NONE", "NONE")

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
call s:hi("CursorLineSign", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("CursorLineFold", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("CursorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("ColorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")

call s:hi("LineNr", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("LineNrAbove", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("LineNrBelow", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("CursorLineNr", "NONE", s:fg, s:overlay, "NONE", "NONE")

call s:hi("SignColumn", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("SignColumnSB", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("Folded", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("FoldColumn", "NONE", s:dim, s:bg, "NONE", "NONE")

call s:hi("VertSplit", "NONE", s:overlay, "NONE", "NONE", "NONE")
call s:hi("WinSeparator", "NONE", s:overlay, "NONE", "NONE", "NONE")

call s:hi("NormalFloat", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("FloatBorder", "NONE", s:overlay, s:surface, "NONE", "NONE")
call s:hi("FloatTitle", "NONE", s:sky, s:overlay, "NONE", "NONE")

" Popup menu ──────────────────────────────────────────────────
call s:hi("Pmenu", "NONE", s:muted, s:surface, "NONE", "NONE")
call s:hi("PmenuSel", "NONE", s:fg, s:highlight_high, "bold", "bold")
call s:hi("PmenuSbar", "NONE", "NONE", s:overlay, "NONE", "NONE")
call s:hi("PmenuThumb", "NONE", "NONE", s:muted, "NONE", "NONE")
call s:hi("PmenuMatch", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("PmenuMatchSel", "NONE", s:fg, s:highlight_high, "bold", "bold")
call s:hi("PmenuExtra", "NONE", s:muted, s:surface, "NONE", "NONE")
call s:hi("PmenuExtraSel", "NONE", s:silver, s:highlight_high, "bold", "bold")
call s:hi("PmenuKind", "NONE", s:sky, s:surface, "NONE", "NONE")
call s:hi("PmenuKindSel", "NONE", s:sky, s:highlight_high, "bold", "bold")
call s:hi("WildMenu", "NONE", s:muted, s:surface, "NONE", "NONE")

" Statusline ──────────────────────────────────────────────────
call s:hi("StatusLine", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("StatusLineNC", "NONE", s:dim, s:surface, "NONE", "NONE")
call s:hi("StatusLineTerm", "NONE", s:bg, s:cyan, "NONE", "NONE")
call s:hi("StatusLineTermNC", "NONE", s:dim, s:surface, "NONE", "NONE")

" Tabs ────────────────────────────────────────────────────────
call s:hi("TabLine", "NONE", s:dim, s:surface, "NONE", "NONE")
call s:hi("TabLineFill", "NONE", "NONE", s:surface, "NONE", "NONE")
call s:hi("TabLineSel", "NONE", s:sky, s:bg, "NONE", "NONE")
call s:hi("Title", "NONE", s:sky, "NONE", "NONE", "NONE")

" Search ──────────────────────────────────────────────────────
call s:hi("Search", "NONE", s:fg, s:search_bg, "NONE", "NONE")
call s:hi("IncSearch", "NONE", s:bg, s:search, "bold", "bold")
call s:hi("CurSearch", "NONE", s:bg, s:search, "bold", "bold")
call s:hi("Substitute", "NONE", s:bg, s:search, "NONE", "NONE")
call s:hi("MatchParen", "NONE", s:search, "NONE", "bold", "bold")

" Visual ──────────────────────────────────────────────────────
call s:hi("Visual", "NONE", "NONE", s:visual, "NONE", "NONE")
call s:hi("VisualNOS", "NONE", "NONE", s:visual, "NONE", "NONE")

" Diffs ───────────────────────────────────────────────────────
call s:hi("DiffAdd", "NONE", "NONE", s:diff_add, "NONE", "NONE")
call s:hi("DiffChange", "NONE", "NONE", s:diff_change, "NONE", "NONE")
call s:hi("DiffDelete", "NONE", s:red, s:diff_delete, "NONE", "NONE")
call s:hi("DiffText", "NONE", "NONE", s:diff_text, "NONE", "NONE")
call s:hi("DiffTextAdd", "NONE", "NONE", s:diff_text, "NONE", "NONE")
call s:hi("LuaLineDiffAdd", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("LuaLineDiffChange", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("LuaLineDiffDelete", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Added", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Changed", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("Removed", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("diffAdded", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("diffRemoved", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("diffChanged", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("diffOldFile", "NONE", s:fg, s:diff_delete, "NONE", "NONE")
call s:hi("diffNewFile", "NONE", s:fg, s:diff_add, "NONE", "NONE")
call s:hi("diffLine", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("diffFile", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("diffIndexLine", "NONE", s:rose, "NONE", "NONE", "NONE")

" Messages ────────────────────────────────────────────────────
call s:hi("ModeMsg", "NONE", s:fg, "NONE", "bold", "bold")
call s:hi("MsgArea", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("MoreMsg", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Question", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("ErrorMsg", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("WarningMsg", "NONE", s:yellow, "NONE", "NONE", "NONE")

" Misc ────────────────────────────────────────────────────────
call s:hi("Directory", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("Underlined", "NONE", "NONE", "NONE", "underline", "underline")
call s:hi("Bold", "NONE", "NONE", "NONE", "bold", "bold")
call s:hi("Italic", "NONE", "NONE", "NONE", "italic", "italic")

" QuickFix ────────────────────────────────────────────────────
call s:hi("qfFileName", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("qfLineNr", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("QuickFixLine", "NONE", "NONE", s:highlight_med, "bold", "bold")

" Diagnostics ─────────────────────────────────────────────────
call s:hi("DiagnosticError", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("DiagnosticWarn", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("DiagnosticInfo", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("DiagnosticHint", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("DiagnosticUnnecessary", "NONE", s:dim, "NONE", "NONE", "NONE")
call s:hi("DiagnosticVirtualTextError", "NONE", s:diag_fg_error, s:diag_bg_error, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextWarn", "NONE", s:diag_fg_warning, s:diag_bg_warning, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextInfo", "NONE", s:diag_fg_info, s:diag_bg_info, "NONE", "NONE")
call s:hi("DiagnosticVirtualTextHint", "NONE", s:diag_fg_hint, s:diag_bg_hint, "NONE", "NONE")
call s:hi("DiagnosticUnderlineError", s:red, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineWarn", s:yellow, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineInfo", s:blue, "NONE", "NONE", "undercurl", "NONE")
call s:hi("DiagnosticUnderlineHint", s:sky, "NONE", "NONE", "undercurl", "NONE")
call s:hi("SpellBad", s:red, "NONE", "NONE", "undercurl", "NONE")
call s:hi("SpellCap", s:yellow, "NONE", "NONE", "undercurl", "NONE")
call s:hi("SpellLocal", s:blue, "NONE", "NONE", "undercurl", "NONE")
call s:hi("SpellRare", s:sky, "NONE", "NONE", "undercurl", "NONE")

" Health ──────────────────────────────────────────────────────
call s:hi("healthError", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("healthSuccess", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("healthWarning", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("helpExample", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("helpCommand", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("ComplHint", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("debugPC", "NONE", "NONE", s:overlay, "NONE", "NONE")
call s:hi("debugBreakpoint", "NONE", s:red, "NONE", "NONE", "NONE")

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
