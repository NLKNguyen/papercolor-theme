set background=dark
let g:colors_name = "PaperColor-Dark"

" Palette: These color names are corresponding to the original light version,
"          and they don't represent the HEX code that they store in this file.
let s:red     = "#87df00" "Include/Exception
let s:green   = "#dfaf00" "Boolean/Special
let s:blue    = "#00afaf" "Keyword

let s:pink    = "#afdf00" "Type
let s:olive   = "#dfaf5f" "String
let s:navy    = "#ff875f" "StorageClass

let s:orange  = "#ff5faf" "Number
let s:purple  = "#af87df" "Repeat/Conditional
let s:aqua    = "#5fafdf" "Operator/Delimiter

" Basics:
let s:foreground   = "#d0d0d0"
let s:background   = "#262626"
let s:selection    = "#3a3a3a"
let s:nontext      = "#585858"
let s:window       = "#3a3a3a"
let s:divider      = "#5f8787"
let s:linenumber   = "#606060"
let s:comment      = "#5f875f"
let s:todo         = "#00af5f"
let s:cursorline   = "#444444"
let s:cursorcolumn = "#303030"
let s:error        = "#5f0000"

" Spelling:
let s:spellbad   = "#5f0000"
let s:spellcap   = "#5f005f"
let s:spellrare  = "#005f00"
let s:spelllocal = "#00005f"

" Tabline:
let s:tabline_bg          = "#3a3a3a"
let s:tabline_active_fg   = "#1c1c1c"
let s:tabline_active_bg   = "#00afaf"
let s:tabline_inactive_fg = "#c6c6c6"
let s:tabline_inactive_bg = "#585858"

" Statusline:
let s:statusline_active_fg   = "#1c1c1c"
let s:statusline_active_bg   = "#5f8787"
let s:statusline_inactive_fg = "#c6c6c6"
let s:statusline_inactive_bg = "#303030"

" Search:
let s:search_fg = "#000000"
let s:search_bg = "#00875f"

" Visual:
let s:visual_fg = "#000000"
let s:visual_bg = "#8787af"

" Folded:
let s:folded_fg = "#000000"
let s:folded_bg = "#875f87"

" Diff:
let s:diffadd_fg    = "#000000"
let s:diffadd_bg    = "#5faf00"

let s:diffdelete_fg = "#5f0000"
let s:diffdelete_bg = "#5f0000"

let s:difftext_fg   = "#000000"
let s:difftext_bg   = "#ffdf5f"

let s:diffchange_fg = "#000000"
let s:diffchange_bg = "#dfaf00"

" User Custom:
if exists("g:PaperColor_Dark_CursorLine")
  let s:cursorline = g:PaperColor_Dark_CursorLine
endif
