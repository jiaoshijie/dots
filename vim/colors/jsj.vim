function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg")  ? a:style.fg  : "NONE")
    \ "guibg=" (has_key(a:style, "bg")  ? a:style.bg  : "NONE")
    \ "guisp=" (has_key(a:style, "sp")  ? a:style.sp  : "NONE")
    \ "gui="   (has_key(a:style, "gui") ? a:style.gui : "NONE")
    \ "cterm=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
    \ "ctermfg=None"
    \ "ctermbg=None"
    \ "ctermul=None"
endfunction

highlight clear
set background=dark
let g:colors_name="jsj"

if exists("syntax_on")
  syntax reset
endif

" bg -> hard : #1d2021, normal : #282828, soft : #32302f
" fg -> hard : #f9f5d7, normal : #fbf1c7, soft : #f2e5bc
let s:bg = "#1d2021"
let s:fg = "#fbf1c7"
let s:red = "#fb4934"
let s:green = "#b8bb26"
let s:yellow = "#fabd2f"
let s:blue = "#83a598"
let s:purple = "#d3869b"
let s:aqua = "#8ec07c"
let s:orange = "#f38019"
let s:gray = "#928374"
let s:gray_bg = "#504945"
let s:gray_fg = "#bdae93"
let s:statusline = "#2c323c"
let s:statuslineNC = "#5c6370"
let s:cursor_fg = "#000000"
let s:cursor_bg = "#5588FF"
let s:cursor_line_bg = "#3c3836"

" ----------------------> `h syntax.txt:5811` <-------------------------------
hi! link ColorColumn CursorLine
call s:h("Conceal", { "fg": s:gray })
" [[ cursor ]]
call s:h("Cursor", { "fg": s:cursor_fg, "bg": s:cursor_bg })
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
call s:h("CursorLine", { "bg": s:cursor_line_bg })
hi! link Directory Normal
" [[ Diff mode 'vimdiff, vim -d']]
call s:h("DiffAdd", { "fg": s:green, "bg": s:bg, "gui": "reverse" })
call s:h("DiffChange", { "fg": s:aqua, "bg": s:bg, "gui": "reverse" })
call s:h("DiffDelete", { "fg": s:red, "bg": s:bg, "gui": "reverse" })
call s:h("DiffText", { "fg": s:yellow, "bg": s:bg, "gui": "reverse" })
hi! link EndOfBuffer NonText
call s:h("ErrorMsg", { "fg": s:red, "gui": "bold" })
call s:h("VertSplit", { "fg": s:gray })
call s:h("Folded", { "fg": s:gray, "bg": s:gray_bg, "gui": "italic" })
call s:h("FoldColumn", { "fg": s:gray, "bg": s:gray_bg })
hi! link SignColumn LineNr
call s:h("IncSearch", { "fg": s:orange, "bg": s:bg, "gui": "reverse" })
call s:h("LineNr", { "fg": s:gray })
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
call s:h("CursorLineNr", { "fg": s:yellow, "bg": s:cursor_line_bg, "gui": "bold" })
hi! link CursorLineFold FoldColumn
hi! link CursorLineSign SignColumn
call s:h("MatchParen", { "fg": s:orange, "bg": s:gray_bg, "gui": "bold" })
hi! link MessageWindow WarningMsg
call s:h("ModeMsg", { "fg": s:yellow })
hi! link MoreMsg ModeMsg
call s:h("NonText", { "fg": s:gray_bg })
call s:h("Normal", { "fg": s:fg, "bg": s:bg })
" [[ Pmenu ]]
call s:h("Pmenu", { "fg": s:fg, "bg": s:bg })
call s:h("PmenuSel", { "fg": s:bg, "bg": s:blue, "gui": "bold" })
hi! link PmenuKind Pmenu
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
call s:h("PmenuSbar", { "bg": s:gray_bg })
call s:h("PmenuThumb", { "bg": s:gray })
call s:h("PmenuMatch", { "fg": s:fg, "gui": "bold" })
hi! link PmenuMatchSel PmenuMatch
call s:h("ComplMatchIns", { "fg": s:fg })
hi! link PopupSelected PmenuSel
hi! link PopupNotification WarningMsg
call s:h("Question", { "fg": s:orange })
hi! link QuickFixLine Search
call s:h("Search", { "fg": s:bg, "bg": s:yellow })
hi! link CurSearch IncSearch
call s:h("SpecialKey", { "fg": s:gray_bg })
" [[ Spelling ]]
call s:h("SpellBad", { "fg": s:bg, "bg": s:red })
call s:h("SpellCap", { "fg": s:bg, "bg": s:blue })
call s:h("SpellLocal", { "fg": s:bg, "bg": s:aqua })
call s:h("SpellRare", { "fg": s:bg, "bg": s:purple })
call s:h("StatusLine", { "bg": s:statusline })
call s:h("StatusLineNC", { "bg": s:statuslineNC })
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:h("TabLine", { "fg": s:gray, "bg": s:fg })
hi! link TabLineFill TabLine
call s:h("TabLineSel", { "fg": s:yellow, "bg": s:gray_bg })
hi! link Terminal Normal
call s:h("Title", { "fg": s:green, "gui": "bold" })
call s:h("Visual", { "bg": s:gray_bg, "gui": "reverse" })
hi! link VisualNOS Visual
call s:h("WarningMsg", { "fg": s:red })
call s:h("WildMenu", { "fg": s:blue, "bg": s:bg, "gui": "bold" })

" NOTE: for GUI
" Menu
" Scrollbar
" Tooltip

" ----------------------> `h syntax.txt:226` <-------------------------------
call s:h("Comment", { "fg": s:gray, "gui": "italic" })
call s:h("Constant", { "fg": s:purple })
call s:h("String", { "fg": s:green })
call s:h("Character", { "fg": s:purple })
call s:h("Number", { "fg": s:purple })
call s:h("Boolean", { "fg": s:purple })
call s:h("Float", { "fg": s:purple })
call s:h("Identifier", { "fg": s:blue })
call s:h("Function", { "fg": s:fg })
call s:h("Statement", { "fg": s:red })
call s:h("Conditional", { "fg": s:red })
call s:h("Repeat", { "fg": s:red })
call s:h("Label", { "fg": s:blue })
call s:h("Operator", { "fg": s:gray_fg })
call s:h("Keyword", { "fg": s:red })
call s:h("Exception", { "fg": s:red })
call s:h("PreProc", { "fg": s:aqua })
call s:h("Include", { "fg": s:aqua })
call s:h("Define", { "fg": s:aqua })
call s:h("Macro", { "fg": s:aqua })
call s:h("PreCondit", { "fg": s:aqua })
call s:h("Type", { "fg": s:yellow })
call s:h("StorageClass", { "fg": s:red })
call s:h("Structure", { "fg": s:red })
call s:h("Typedef", { "fg": s:red })
call s:h("Special", { "fg": s:green })
call s:h("SpecialChar", { "fg": s:purple })
call s:h("Tag", { "fg": s:aqua })
call s:h("Delimiter", { "fg": s:gray })
call s:h("SpecialComment", { "fg": s:orange })
call s:h("Debug", { "fg": s:fg })
call s:h("Underlined", { "fg": s:blue, "gui": "underline" })
hi! link Ignore Conceal
call s:h("Error", { "fg": s:red, "bg": s:bg, "gui": "reverse,bold" })
call s:h("Todo", { "fg": s:yellow, "bg": s:bg, "gui": "reverse,bold" })
call s:h("Added", { "fg": s:green })
call s:h("Changed", { "fg": s:yellow })
call s:h("Removed", { "fg": s:red })

" ---------------------------> FileType Specific <----------------------------
" [[ Netrw ]]
call s:h("netrwDir", { "fg": s:aqua })
call s:h("netrwClassify", { "fg": s:aqua })
call s:h("netrwLink", { "fg": s:gray })
call s:h("netrwSymLink", { "fg": s:blue, "gui": "underline,italic" })
call s:h("netrwExe", { "fg": s:yellow })
call s:h("netrwComment", { "fg": s:gray })
call s:h("netrwList", { "fg": s:blue })
call s:h("netrwHelpCmd", { "fg": s:aqua })
call s:h("netrwCmdSep", { "fg": s:gray_bg })
call s:h("netrwVersion", { "fg": s:green })

" [[ diff file *.diff ]]
call s:h("diffAdded", { "fg": s:green })
call s:h("diffRemoved", { "fg": s:red })
call s:h("diffChanged", { "fg": s:aqua })
call s:h("diffFile", { "fg": s:orange })
call s:h("diffNewFile", { "fg": s:yellow })
call s:h("diffLine", { "fg": s:blue })

" [[ Markdown ]]
call s:h("markdownH1", { "fg": s:yellow, "gui": "bold" })
call s:h("markdownH2", { "fg": s:yellow, "gui": "bold" })
call s:h("markdownH3", { "fg": s:green, "gui": "bold" })
call s:h("markdownH4", { "fg": s:green, "gui": "bold" })
call s:h("markdownH5", { "fg": s:green })
call s:h("markdownH6", { "fg": s:green })
call s:h("markdownHeadingRule", { "fg": s:gray })
call s:h("markdownHeadingDelimiter", { "fg": s:gray_fg })
call s:h("markdownOrderedListMarker", { "fg": s:gray_fg })
call s:h("markdownListMarker", { "fg": s:gray })
call s:h("markdownBlockquote", { "fg": s:gray })
call s:h("markdownRule", { "fg": s:gray })
call s:h("markdownFootnote", { "fg": s:blue, "gui": "underline" })
call s:h("markdownFootnoteDefinition", { "fg": s:gray_fg })
call s:h("markdownLinkText", { "fg": s:fg })
call s:h("markdownIdDeclaration", { "fg": s:gray_fg })
hi! link markdownAutomaticLink markdownUrl
call s:h("markdownUrl", { "fg": s:blue, "gui": "underline" })
call s:h("markdownUrlTitle", { "fg": s:green })
call s:h("markdownUrlDelimiter", { "fg": s:gray_fg })
call s:h("markdownUrlTitleDelimiter", { "fg": s:gray_fg })
call s:h("markdownItalic", { "fg": s:gray_fg, "gui": "italic" })
call s:h("markdownBold", { "fg": s:orange, "gui": "bold" })
call s:h("markdownBoldItalic", { "fg": s:orange, "gui": "bold,italic" })
call s:h("markdownStrike", { "fg": s:gray_fg, "gui": "strikethrough" })
call s:h("markdownCode", { "fg": s:aqua })
hi! link markdownCodeDelimiter markdownCode
call s:h("markdownEscape", { "fg": s:gray })
call s:h("markdownError", { "fg": s:red })
call s:h("markdownCodeBlock", { "fg": s:aqua })
call s:h("markdownLinkDelimiter", { "fg": s:gray })
call s:h("markdownLinkTextDelimiter", { "fg": s:gray_fg })
