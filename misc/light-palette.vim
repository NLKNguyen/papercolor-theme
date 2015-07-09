" Palette:
"
let s:red     = "#df0000" "Include/Exception
let s:green   = "#008700" "Boolean/Special
let s:blue    = "#4271ae" "Keyword

let s:pink    = "#d7005f" "Type
let s:olive   = "#718c00" "String
let s:navy    = "#005f87" "StorageClass

let s:orange  = "#d75f00" "Number
let s:purple  = "#8959a8" "Repeat/Conditional
let s:aqua    = "#3e999f" "Operator/Delimiter

" Basics:
let s:foreground   = "#4d4d4c"
let s:background   = "#F5F5F5"
let s:selection    = "#d6d6d6"
let s:nontext      = "#dfafff"
let s:window       = "#efefef"
let s:divider      = s:navy
let s:linenumber   = "#bcbcbc"
let s:comment      = "#8e908c"
let s:todo         = "#00af5f"
let s:cursorline   = "#dfdfff"
let s:cursorcolumn = "#efefef"
let s:error        = "#ffafdf"

" Spelling:
let s:spellbad   = "#ffafdf"
let s:spellcap   = "#ffffaf"
let s:spellrare  = "#afff87"
let s:spelllocal = "#dfdfff"

" Tabline:
let s:tabline_bg          = s:navy
let s:tabline_active_fg   = s:foreground
let s:tabline_active_bg   = s:window
let s:tabline_inactive_fg = s:background
let s:tabline_inactive_bg = s:aqua

" Statusline:
let s:statusline_active_fg   = s:window
let s:statusline_active_bg   = s:navy
let s:statusline_inactive_fg = s:foreground
let s:statusline_inactive_bg = s:window

" Search:
let s:search_fg = s:foreground
let s:search_bg = "#ffff5f"

" Visual:
let s:visual_fg = s:background
let s:visual_bg = s:blue

" Folded:
let s:folded_fg = s:navy
let s:folded_bg = s:cursorline

" Diff:
let s:diffadd_fg    = ""
let s:diffadd_bg    = "#afffaf"

let s:diffdelete_fg = "#ffdfff"
let s:diffdelete_bg = "#ffdfff"

let s:difftext_fg   = ""
let s:difftext_bg   = "#ffffdf"

let s:diffchange_fg = ""
let s:diffchange_bg   = "#ffffaf"

set background=light
hi clear
syntax reset
let g:colors_name = "PaperColor"
