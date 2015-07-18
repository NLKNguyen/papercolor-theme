" Theme: PaperColor
" Author: Nguyen Nguyen <NLKNguyen@MSN.com>
" License: MIT
" Origin: http://github.com/NLKNguyen/papercolor-theme.git
"
" Modified from the theme 'Tomorrow'

hi clear
syntax reset
let g:colors_name = "PaperColor"

let s:is_dark=(&background == 'dark')

if s:is_dark " DARK VARIANT
  " Palette: These color names are corresponding to the original light version,
  "          and they don't represent the HEX code that they store in this block.
  let s:red     = "#00af5f" "Include/Exception
  let s:green   = "#dfaf00" "Boolean/Special
  let s:blue    = "#00afaf" "Keyword

  let s:pink    = "#afdf00" "Type
  let s:olive   = "#dfaf5f" "String
  let s:navy    = "#df875f" "StorageClass

  let s:orange  = "#ff5faf" "Number
  let s:purple  = "#af87af" "Repeat/Conditional
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
  let s:todo         = "#df005f"
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

else " LIGHT VARIANT
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
  let s:cursorline   = "#eeeeee"
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
  let s:statusline_inactive_bg = "#dadada"

  " Search:
  let s:search_fg = s:foreground
  let s:search_bg = "#ffff5f"

  " Visual:
  let s:visual_fg = s:background
  let s:visual_bg = s:blue

  " Folded:
  let s:folded_fg = s:navy
  let s:folded_bg = "#dfdfff"

  " Diff:
  let s:diffadd_fg    = ""
  let s:diffadd_bg    = "#afffaf"

  let s:diffdelete_fg = "#ffdfff"
  let s:diffdelete_bg = "#ffdfff"

  let s:difftext_fg   = ""
  let s:difftext_bg   = "#ffffdf"

  let s:diffchange_fg = ""
  let s:diffchange_bg = "#ffffaf"

  " User Custom:
  if exists("g:PaperColor_Light_CursorLine")
    let s:cursorline = g:PaperColor_Light_CursorLine
  endif

endif

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " Returns an approximate grey index for the given grey level
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " Returns the palette index for the given grey index
  fun <SID>grey_colour(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " Returns an approximate colour index for the given colour level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual colour level for the given colour index
  fun <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " Returns the palette index for the given R/G/B colour indices
  fun <SID>rgb_colour(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " Returns the palette index to approximate the given R/G/B colour levels
  fun <SID>colour(r, g, b)
    " Get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " Get the closest colour
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " There are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " Use the grey
        return <SID>grey_colour(l:gx)
      else
        " Use the colour
        return <SID>rgb_colour(l:x, l:y, l:z)
      endif
    else
      " Only one possibility
      return <SID>rgb_colour(l:x, l:y, l:z)
    endif
  endfun

  " Returns the palette index to approximate the '#rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 1, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 3, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 5, 2)) + 0

    return <SID>colour(l:r, l:g, l:b)
  endfun

  " Sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun

  " Vim Highlighting
  call <SID>X("Normal", s:foreground, s:background, "")

  " Switching between dark & light variant through `set background`
  " https://github.com/NLKNguyen/papercolor-theme/pull/20
  if s:is_dark
    set background=dark
  else
    set background=light
  endif

  highlight LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=darkgrey guibg=NONE
  call <SID>X("NonText", s:nontext, "", "")
  call <SID>X("SpecialKey", s:nontext, "", "")
  call <SID>X("Search", s:search_fg, s:search_bg, "")
  call <SID>X("LineNr", s:linenumber, "", "")
  call <SID>X("TabLine", s:tabline_inactive_fg, s:tabline_inactive_bg, "None")
  call <SID>X("TabLineFill", "", s:tabline_bg, "None")
  call <SID>X("TabLineSel", s:tabline_active_fg, s:tabline_active_bg, "None")
  call <SID>X("StatusLine", s:statusline_active_fg, s:statusline_active_bg, "bold")
  call <SID>X("StatusLineNC", s:statusline_inactive_fg, s:statusline_inactive_bg, "None")
  call <SID>X("VertSplit", s:divider, s:background, "none")
  " call <SID>X("VertSplit", s:red, s:background, "none")
  call <SID>X("Visual", s:visual_fg, s:visual_bg, "")
  call <SID>X("Directory", s:blue, "", "")
  call <SID>X("ModeMsg", s:olive, "", "")
  call <SID>X("MoreMsg", s:olive, "", "")
  call <SID>X("Question", s:olive, "", "")
  call <SID>X("WarningMsg", s:pink, "", "")
  call <SID>X("MatchParen", "", s:selection, "")
  call <SID>X("Folded", s:folded_fg, s:folded_bg, "")
  call <SID>X("FoldColumn", "", s:background, "")
  if version >= 700
    call <SID>X("CursorLine", "", s:cursorline, "none")
    call <SID>X("CursorColumn", "", s:cursorcolumn, "none")
    call <SID>X("PMenu", s:foreground, s:selection, "none")
    call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
    call <SID>X("SignColumn", "", s:background, "none")
  end
  if version >= 703
    call <SID>X("ColorColumn", "", s:cursorcolumn, "none")
  end

  " Standard Group Highlighting:
  call <SID>X("Comment", s:comment, "", "")

  call <SID>X("Constant", s:orange, "", "")
  call <SID>X("String", s:olive, "", "")
  call <SID>X("Character", s:olive, "", "")
  call <SID>X("Number", s:orange, "", "")
  call <SID>X("Boolean", s:green, "", "bold")
  call <SID>X("Float", s:orange, "", "")

  call <SID>X("Identifier", s:navy, "", "")
  call <SID>X("Function", s:foreground, "", "")

  call <SID>X("Statement", s:pink, "", "")
  call <SID>X("Conditional", s:purple, "", "bold")
  call <SID>X("Repeat", s:purple, "", "bold")
  call <SID>X("Label", s:blue, "", "")
  call <SID>X("Operator", s:aqua, "", "none")
  call <SID>X("Keyword", s:blue, "", "")
  call <SID>X("Exception", s:red, "", "")

  call <SID>X("PreProc", s:blue, "", "")
  call <SID>X("Include", s:red, "", "")
  call <SID>X("Define", s:blue, "", "")
  call <SID>X("Macro", s:blue, "", "")
  call <SID>X("PreCondit", s:aqua, "", "")

  call <SID>X("Type", s:pink, "", "bold")
  call <SID>X("StorageClass", s:navy, "", "bold")
  call <SID>X("Structure", s:blue, "", "bold")
  call <SID>X("Typedef", s:pink, "", "bold")

  call <SID>X("Special", s:foreground, "", "")
  call <SID>X("SpecialChar", s:foreground, "", "")
  call <SID>X("Tag", s:green, "", "")
  call <SID>X("Delimiter",s:aqua, "", "")
  call <SID>X("SpecialComment", s:comment, "", "bold")
  call <SID>X("Debug", s:orange, "", "")

  "call <SID>X("Ignore", "666666", "", "")

  call <SID>X("Error", s:foreground, s:error, "")
  call <SID>X("Todo", s:todo, s:background, "bold")

  call <SID>X("Title", s:comment, "", "")
  call <SID>X("Global", s:blue, "", "")



  " VimL Highlighting
  call <SID>X("vimCommand", s:pink, "", "none")
  call <SID>X("vimVar", s:navy, "", "")
  call <SID>X("vimFuncKey", s:pink, "", "")
  call <SID>X("vimFunction", s:blue, "", "bold")
  call <SID>X("vimNotFunc", s:pink, "", "")
  call <SID>X("vimMap", s:red, "", "")
  call <SID>X("vimAutoEvent", s:aqua, "", "bold")
  call <SID>X("vimMapModKey", s:aqua, "", "")
  call <SID>X("vimFuncName", s:purple, "", "")
  call <SID>X("vimIsCommand", s:foreground, "", "")
  call <SID>X("vimFuncVar", s:aqua, "", "")
  call <SID>X("vimLet", s:red, "", "")
  call <SID>X("vimMapRhsExtend", s:foreground, "", "")
  call <SID>X("vimCommentTitle", s:comment, "", "bold")
  call <SID>X("vimBracket", s:aqua, "", "")
  call <SID>X("vimParenSep", s:aqua, "", "")
  call <SID>X("vimSynType", s:olive, "", "bold")
  call <SID>X("vimNotation", s:aqua, "", "")
  call <SID>X("vimOper", s:foreground, "", "")
  call <SID>X("vimOperParen", s:foreground, "", "")

  " Makefile Highlighting
  call <SID>X("makeIdent", s:blue, "", "")
  call <SID>X("makeSpecTarget", s:olive, "", "")
  call <SID>X("makeTarget", s:red, "", "")
  call <SID>X("makeStatement", s:aqua, "", "bold")
  call <SID>X("makeCommands", s:foreground, "", "")
  call <SID>X("makeSpecial", s:orange, "", "bold")

  " CMake Highlighting
  call <SID>X("cmakeStatement", s:pink, "", "")
  call <SID>X("cmakeArguments", s:foreground, "", "")
  call <SID>X("cmakeVariableValue", s:blue, "", "")
  call <SID>X("cmakeOperators", s:red, "", "")

  " C Highlighting
  call <SID>X("cType", s:pink, "", "bold")
  call <SID>X("cFormat", s:olive, "", "")
  call <SID>X("cStorageClass", s:navy, "", "bold")

  call <SID>X("cBoolean", s:green, "", "")
  call <SID>X("cCharacter", s:olive, "", "")
  call <SID>X("cConstant", s:green, "", "bold")
  call <SID>X("cConditional", s:purple, "", "bold")
  call <SID>X("cSpecial", s:olive, "", "bold")
  call <SID>X("cDefine", s:blue, "", "")
  call <SID>X("cNumber", s:orange, "", "")
  call <SID>X("cPreCondit", s:aqua, "", "")
  call <SID>X("cRepeat", s:purple, "", "bold")
  call <SID>X("cLabel",s:aqua, "", "")
  " call <SID>X("cAnsiFunction",s:aqua, "", "bold")
  " call <SID>X("cAnsiName",s:pink, "", "")
  call <SID>X("cDelimiter",s:blue, "", "")
  " call <SID>X("cBraces",s:foreground, "", "")
  " call <SID>X("cIdentifier",s:blue, s:pink, "")
  " call <SID>X("cSemiColon","", s:blue, "")
  call <SID>X("cOperator",s:aqua, "", "")
  " call <SID>X("cStatement",s:pink, "", "")
  call <SID>X("cFunction", s:foreground, "", "")
  " call <SID>X("cTodo", s:comment, "", "bold")
  " call <SID>X("cStructure", s:blue, "", "bold")
  call <SID>X("cCustomParen", s:foreground, "", "")
  " call <SID>X("cCustomFunc", s:foreground, "", "")
  " call <SID>X("cUserFunction",s:blue, "", "bold")
  call <SID>X("cOctalZero", s:purple, "", "bold")

  " CPP highlighting
  call <SID>X("cppBoolean", s:navy, "", "")
  call <SID>X("cppSTLnamespace", s:purple, "", "")
  call <SID>X("cppSTLconstant", s:foreground, "", "")
  call <SID>X("cppSTLtype", s:foreground, "", "")
  call <SID>X("cppSTLexception", s:pink, "", "")
  call <SID>X("cppSTLfunctional", s:foreground, "", "bold")
  call <SID>X("cppSTLiterator", s:foreground, "", "bold")
  " call <SID>X("cppSTLfunction", s:aqua, "", "bold")
  call <SID>X("cppExceptions", s:red, "", "")
  call <SID>X("cppStatement", s:blue, "", "")
  call <SID>X("cppStorageClass", s:navy, "", "bold")
  call <SID>X("cppAccess",s:blue, "", "")
  " call <SID>X("cppSTL",s:blue, "", "")


  " Lex highlighting
  call <SID>X("lexCFunctions", s:foreground, "", "")
  call <SID>X("lexAbbrv", s:purple, "", "")
  call <SID>X("lexAbbrvRegExp", s:aqua, "", "")
  call <SID>X("lexAbbrvComment", s:comment, "", "")
  call <SID>X("lexBrace", s:navy, "", "")
  call <SID>X("lexPat", s:aqua, "", "")
  call <SID>X("lexPatComment", s:comment, "", "")
  call <SID>X("lexPatTag", s:orange, "", "")
  " call <SID>X("lexPatBlock", s:foreground, "", "bold")
  call <SID>X("lexSlashQuote", s:foreground, "", "")
  call <SID>X("lexSep", s:foreground, "", "")
  call <SID>X("lexStartState", s:orange, "", "")
  call <SID>X("lexPatTagZone", s:olive, "", "bold")
  call <SID>X("lexMorePat", s:olive, "", "bold")
  call <SID>X("lexOptions", s:olive, "", "bold")
  call <SID>X("lexPatString", s:olive, "", "")

  " Yacc highlighting
  call <SID>X("yaccNonterminal", s:navy, "", "")
  call <SID>X("yaccDelim", s:orange, "", "")
  call <SID>X("yaccInitKey", s:aqua, "", "")
  call <SID>X("yaccInit", s:navy, "", "")
  call <SID>X("yaccKey", s:purple, "", "")
  call <SID>X("yaccVar", s:aqua, "", "")

  " NASM highlighting
  call <SID>X("nasmStdInstruction", s:navy, "", "")
  call <SID>X("nasmGen08Register", s:aqua, "", "")
  call <SID>X("nasmGen16Register", s:aqua, "", "")
  call <SID>X("nasmGen32Register", s:aqua, "", "")
  call <SID>X("nasmGen64Register", s:aqua, "", "")
  call <SID>X("nasmHexNumber", s:purple, "", "")
  call <SID>X("nasmStorage", s:aqua, "", "bold")
  call <SID>X("nasmLabel", s:pink, "", "")
  call <SID>X("nasmDirective", s:blue, "", "bold")
  call <SID>X("nasmLocalLabel", s:orange, "", "")

  " GAS highlighting
  call <SID>X("gasSymbol", s:pink, "", "")
  call <SID>X("gasDirective", s:blue, "", "bold")
  call <SID>X("gasOpcode_386_Base", s:navy, "", "")
  call <SID>X("gasDecimalNumber", s:purple, "", "")
  call <SID>X("gasSymbolRef", s:pink, "", "")
  call <SID>X("gasRegisterX86", s:blue, "", "")
  call <SID>X("gasOpcode_P6_Base", s:navy, "", "")
  call <SID>X("gasDirectiveStore", s:foreground, "", "bold")

  " MIPS highlighting
  call <SID>X("mipsInstruction", s:pink, "", "")
  call <SID>X("mipsRegister", s:navy, "", "")
  call <SID>X("mipsLabel", s:aqua, "", "bold")
  call <SID>X("mipsDirective", s:purple, "", "bold")

  " Shell/Bash highlighting
  call <SID>X("bashStatement", s:foreground, "", "bold")
  call <SID>X("shDerefVar", s:aqua, "", "bold")
  call <SID>X("shDerefSimple", s:aqua, "", "")
  call <SID>X("shFunction", s:orange, "", "bold")
  call <SID>X("shStatement", s:foreground, "", "")
  call <SID>X("shLoop", s:purple, "", "bold")
  call <SID>X("shQuote", s:olive, "", "")
  call <SID>X("shCaseEsac", s:aqua, "", "bold")
  call <SID>X("shSnglCase", s:purple, "", "none")
  call <SID>X("shFunctionOne", s:navy, "", "")
  call <SID>X("shCase", s:navy, "", "")

  " HTML Highlighting
  call <SID>X("htmlTitle", s:green, "", "bold")
  call <SID>X("htmlH1", s:green, "", "bold")
  call <SID>X("htmlH2", s:aqua, "", "bold")
  call <SID>X("htmlH3", s:purple, "", "bold")
  call <SID>X("htmlH4", s:orange, "", "bold")
  call <SID>X("htmlTag", s:pink, "", "")
  call <SID>X("htmlTagName", s:pink, "", "")
  call <SID>X("htmlArg", s:blue, "", "")
  call <SID>X("htmlScriptTag", s:pink, "", "")
  call <SID>X("htmlBold", s:foreground, "", "bold")
  call <SID>X("htmlItalic", s:comment, "", "bold")
  call <SID>X("htmlBoldItalic", s:navy, "", "bold")
  " call <SID>X("htmlLink", s:blue, "", "bold")
  call <SID>X("htmlTagN", s:pink, "", "bold")
  call <SID>X("htmlSpecialTagName", s:orange, "", "bold")

  " Markdown Highlighting
  call <SID>X("markdownH1", s:pink, "", "bold")
  call <SID>X("markdownBlockquote", s:pink, "", "")
  call <SID>X("markdownCodeBlock", s:purple, "", "bold")
  call <SID>X("markdownLink", s:blue, "", "bold")
  call <SID>X("mkdCode", s:foreground, s:window, "none")
  call <SID>X("mkdLink", s:blue, "", "bold")
  call <SID>X("mkdURL", s:comment, "", "none")
  call <SID>X("mkdString", s:foreground, "", "none")
  call <SID>X("mkdBlockQuote", s:foreground, s:window, "none")
  call <SID>X("mkdLinkTitle", s:pink, "", "none")
  call <SID>X("mkdDelimiter", s:aqua, "", "")
  call <SID>X("mkdRule", s:pink, "", "")

  " Python Highlighting
  call <SID>X("pythonImport", s:pink, "", "bold")
  call <SID>X("pythonExceptions", s:red, "", "")
  call <SID>X("pythonException", s:purple, "", "bold")
  call <SID>X("pythonInclude", s:red, "", "")
  call <SID>X("pythonStatement", s:pink, "", "")
  call <SID>X("pythonConditional", s:purple, "", "bold")
  call <SID>X("pythonRepeat", s:purple, "", "bold")
  call <SID>X("pythonFunction", s:aqua, "", "bold")
  call <SID>X("pythonPreCondit", s:purple, "", "")
  call <SID>X("pythonExClass", s:orange, "", "")
  call <SID>X("pythonOperator", s:purple, "", "bold")
  call <SID>X("pythonBuiltin", s:foreground, "", "")
  call <SID>X("pythonDecorator", s:orange, "", "")

  call <SID>X("pythonString", s:olive, "", "")
  call <SID>X("pythonEscape", s:olive, "", "bold")
  call <SID>X("pythonStrFormatting", s:olive, "", "bold")

  call <SID>X("pythonBoolean", s:green, "", "bold")
  call <SID>X("pythonExClass", s:red, "", "")
  call <SID>X("pythonBytesEscape", s:olive, "", "bold")
  call <SID>X("pythonDottedName", s:purple, "", "")
  call <SID>X("pythonStrFormat", s:foreground, "", "")
  call <SID>X("pythonBuiltinFunc", s:foreground, "", "")
  call <SID>X("pythonBuiltinObj", s:foreground, "", "")

  " Java Highlighting
  call <SID>X("javaExternal", s:red, "", "")
  call <SID>X("javaAnnotation", s:orange, "", "")
  call <SID>X("javaTypedef", s:aqua, "", "")
  call <SID>X("javaClassDecl", s:blue, "", "bold")
  call <SID>X("javaScopeDecl", s:purple, "", "bold")
  call <SID>X("javaStorageClass", s:navy, "", "bold")
  call <SID>X("javaBoolean", s:navy, "", "")

  " JavaScript Highlighting
  call <SID>X("javaScriptBraces", s:blue, "", "")
  call <SID>X("javaScriptParens", s:blue, "", "")
  call <SID>X("javaScriptIdentifier", s:navy, "", "bold")
  call <SID>X("javaScriptFunction", s:pink, "", "bold")
  call <SID>X("javaScriptConditional", s:purple, "", "bold")
  call <SID>X("javaScriptRepeat", s:purple, "", "bold")
  call <SID>X("javaScriptBoolean", s:orange, "", "")
  " call <SID>X("javaScriptNumber", s:orange, "", "")
  call <SID>X("javaScriptMember", s:navy, "", "")
  " call <SID>X("javascriptNull", s:orange, "", "")
  " call <SID>X("javascriptGlobal", s:blue, "", "")
  " call <SID>X("javascriptStatement", s:pink, "", "")

  " @target: https://github.com/pangloss/vim-javascript
  call <SID>X("jsFuncParens", s:blue, "", "")
  call <SID>X("jsFuncBraces", s:blue, "", "")
  call <SID>X("jsParens", s:blue, "", "")
  call <SID>X("jsBraces", s:blue, "", "")
  call <SID>X("jsNoise", s:blue, "", "")


  " Go Highlighting
  call <SID>X("goDirective", s:red, "", "")
  call <SID>X("goDeclaration", s:blue, "", "bold")
  call <SID>X("goStatement", s:pink, "", "")
  call <SID>X("goConditional", s:purple, "", "bold")
  call <SID>X("goConstants", s:orange, "", "")
  call <SID>X("goFunction", s:orange, "", "")
  " call <SID>X("goTodo", s:comment, "", "bold")
  call <SID>X("goDeclType", s:blue, "", "")
  call <SID>X("goBuiltins", s:purple, "", "")

  " Systemtap Highlighting
  " call <SID>X("stapBlock", s:comment, "", "none")
  call <SID>X("stapComment", s:comment, "", "none")
  call <SID>X("stapProbe", s:aqua, "", "bold")
  call <SID>X("stapStat", s:navy, "", "bold")
  call <SID>X("stapFunc", s:foreground, "", "")
  call <SID>X("stapString", s:olive, "", "")
  call <SID>X("stapTarget", s:navy, "", "")
  call <SID>X("stapStatement", s:pink, "", "")
  call <SID>X("stapType", s:pink, "", "bold")
  call <SID>X("stapSharpBang", s:comment, "", "")
  call <SID>X("stapDeclaration", s:pink, "", "")
  call <SID>X("stapCMacro", s:blue, "", "")

  " DTrace Highlighting
  call <SID>X("dtraceProbe", s:blue, "", "")
  call <SID>X("dtracePredicate", s:purple, "", "bold")
  call <SID>X("dtraceComment", s:comment, "", "")
  call <SID>X("dtraceFunction", s:foreground, "", "")
  call <SID>X("dtraceAggregatingFunction", s:blue, "", "bold")
  call <SID>X("dtraceStatement", s:navy, "", "bold")
  call <SID>X("dtraceIdentifier", s:pink, "", "")
  call <SID>X("dtraceOption", s:pink, "", "")
  call <SID>X("dtraceConstant", s:orange, "", "")
  call <SID>X("dtraceType", s:pink, "", "bold")

  " PlantUML Highlighting
  call <SID>X("plantumlPreProc", s:orange, "", "bold")
  call <SID>X("plantumlDirectedOrVerticalArrowRL", s:pink, "", "")
  call <SID>X("plantumlDirectedOrVerticalArrowLR", s:pink, "", "")
  call <SID>X("plantumlString", s:olive, "", "")
  call <SID>X("plantumlActivityThing", s:purple, "", "")
  call <SID>X("plantumlText", s:navy, "", "")
  call <SID>X("plantumlClassPublic", s:olive, "", "bold")
  call <SID>X("plantumlClassPrivate", s:red, "", "")
  call <SID>X("plantumlColonLine", s:orange, "", "")
  call <SID>X("plantumlClass", s:navy, "", "")
  call <SID>X("plantumlHorizontalArrow", s:pink, "", "")
  call <SID>X("plantumlTypeKeyword", s:blue, "", "bold")
  call <SID>X("plantumlKeyword", s:pink, "", "bold")

  call <SID>X("plantumlType", s:blue, "", "bold")
  call <SID>X("plantumlBlock", s:pink, "", "bold")
  call <SID>X("plantumlPreposition", s:orange, "", "")
  call <SID>X("plantumlLayout", s:blue, "", "bold")
  call <SID>X("plantumlNote", s:orange, "", "")
  call <SID>X("plantumlLifecycle", s:aqua, "", "")
  call <SID>X("plantumlParticipant", s:foreground, "", "bold")


  " Haskell Highlighting
  call <SID>X("haskellType", s:aqua, "", "bold")
  call <SID>X("haskellIdentifier", s:orange, "", "bold")
  call <SID>X("haskellOperators", s:pink, "", "")
  call <SID>X("haskellWhere", s:foreground, "", "bold")
  call <SID>X("haskellDelimiter", s:aqua, "", "")
  call <SID>X("haskellImportKeywords", s:pink, "", "")
  call <SID>X("haskellStatement", s:purple, "", "bold")


  " SQL/MySQL Highlighting
  call <SID>X("sqlStatement", s:pink, "", "bold")
  call <SID>X("sqlType", s:blue, "", "bold")
  call <SID>X("sqlKeyword", s:pink, "", "")
  call <SID>X("sqlOperator", s:aqua, "", "")
  call <SID>X("sqlSpecial", s:green, "", "bold")

  call <SID>X("mysqlVariable", s:olive, "", "bold")
  call <SID>X("mysqlType", s:blue, "", "bold")
  call <SID>X("mysqlKeyword", s:pink, "", "")
  call <SID>X("mysqlOperator", s:aqua, "", "")
  call <SID>X("mysqlSpecial", s:green, "", "bold")


  " Octave/MATLAB Highlighting
  call <SID>X("octaveVariable", s:foreground, "", "")
  call <SID>X("octaveDelimiter", s:pink, "", "")
  call <SID>X("octaveQueryVar", s:foreground, "", "")
  call <SID>X("octaveSemicolon", s:purple, "", "")
  call <SID>X("octaveFunction", s:navy, "", "")
  call <SID>X("octaveSetVar", s:blue, "", "")
  call <SID>X("octaveUserVar", s:foreground, "", "")
  call <SID>X("octaveArithmeticOperator", s:aqua, "", "")
  call <SID>X("octaveBeginKeyword", s:purple, "", "bold")
  call <SID>X("octaveElseKeyword", s:purple, "", "bold")
  call <SID>X("octaveEndKeyword", s:purple, "", "bold")
  call <SID>X("octaveStatement", s:pink, "", "")

  " Ruby Highlighting
  call <SID>X("rubyModule", s:navy, "", "bold")
  call <SID>X("rubyClass", s:pink, "", "bold")
  call <SID>X("rubyPseudoVariable", s:comment, "", "bold")
  call <SID>X("rubyKeyword", s:pink, "", "")
  call <SID>X("rubyInstanceVariable", s:purple, "", "")
  call <SID>X("rubyFunction", s:foreground, "", "bold")
  call <SID>X("rubyDefine", s:pink, "", "")
  call <SID>X("rubySymbol", s:aqua, "", "")
  call <SID>X("rubyConstant", s:blue, "", "")
  call <SID>X("rubyAccess", s:navy, "", "")
  call <SID>X("rubyAttribute", s:green, "", "")
  call <SID>X("rubyInclude", s:red, "", "")
  call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
  call <SID>X("rubyCurlyBlock", s:foreground, "", "")
  call <SID>X("rubyCurlyBlockDelimiter", s:aqua, "", "")
  call <SID>X("rubyArrayDelimiter", s:aqua, "", "")
  call <SID>X("rubyStringDelimiter", s:olive, "", "")
  call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
  call <SID>X("rubyConditional", s:purple, "", "bold")
  call <SID>X("rubyRepeat", s:purple, "", "bold")
  call <SID>X("rubyControl", s:purple, "", "bold")
  call <SID>X("rubyException", s:purple, "", "bold")
  call <SID>X("rubyExceptional", s:purple, "", "bold")
  call <SID>X("rubyBoolean", s:green, "", "bold")

  " Fortran Highlighting
  call <SID>X("fortranUnitHeader", s:foreground, "", "bold")
  call <SID>X("fortranType", s:pink, "", "bold")
  call <SID>X("fortranStructure", s:blue, "", "bold")
  call <SID>X("fortranStorageClass", s:navy, "", "bold")
  call <SID>X("fortranStorageClassR", s:navy, "", "bold")
  call <SID>X("fortranKeyword", s:pink, "", "")
  call <SID>X("fortranReadWrite", s:blue, "", "")
  call <SID>X("fortranIO", s:navy, "", "")

  " R Highlighting
  call <SID>X("rType", s:blue, "", "")
  call <SID>X("rArrow", s:pink, "", "")
  call <SID>X("rDollar", s:blue, "", "")

  " XXD Highlighting
  call <SID>X("xxdAddress", s:navy, "", "")
  call <SID>X("xxdSep", s:pink, "", "")
  call <SID>X("xxdAscii", s:pink, "", "")
  call <SID>X("xxdDot", s:aqua, "", "")

  " PHP Highlighting
  call <SID>X("phpIdentifier", s:foreground, "", "")
  call <SID>X("phpVarSelector", s:pink, "", "")
  call <SID>X("phpKeyword", s:blue, "", "")
  " call <SID>X("phpRepeat", s:purple, "", "bold")
  " call <SID>X("phpConditional", s:purple, "", "bold")
  call <SID>X("phpStatement", s:pink, "", "")
  call <SID>X("phpAssignByRef", s:aqua, "", "bold")
  " call <SID>X("phpSpecialFunction", s:foreground, "", "")
  call <SID>X("phpComparison", s:aqua, "", "")
  call <SID>X("phpBackslashSequences", s:olive, "", "bold")
  call <SID>X("phpMemberSelector", s:blue, "", "")
  call <SID>X("phpStorageClass", s:purple, "", "bold")
  call <SID>X("phpDefine", s:navy, "", "")

  " Perl Highlighting
  call <SID>X("perlFiledescRead", s:green, "", "")
  call <SID>X("perlMatchStartEnd", s:pink, "", "")
  call <SID>X("perlStatementFlow", s:pink, "", "")
  call <SID>X("perlStatementStorage", s:pink, "", "")
  call <SID>X("perlFunction", s:pink, "", "bold")
  call <SID>X("perlMethod", s:foreground, "", "")
  call <SID>X("perlStatementFiledesc", s:orange, "", "")
  call <SID>X("perlVarPlain", s:navy, "", "")
  call <SID>X("perlSharpBang", s:comment, "", "")
  call <SID>X("perlStatementInclude", s:aqua, "", "bold")
  call <SID>X("perlStatementScalar", s:purple, "", "")
  call <SID>X("perlSubName", s:aqua, "", "bold")
  call <SID>X("perlSpecialString", s:olive, "", "bold")

  " Lua Highlighting
  call <SID>X("luaFunc", s:foreground, "", "")
  call <SID>X("luaIn", s:blue, "", "bold")
  call <SID>X("luaFunction", s:pink, "", "")
  call <SID>X("luaStatement", s:blue, "", "")
  call <SID>X("luaRepeat", s:blue, "", "bold")
  call <SID>X("luaCondStart", s:purple, "", "bold")
  call <SID>X("luaTable", s:aqua, "", "bold")
  call <SID>X("luaConstant", s:green, "", "bold")
  call <SID>X("luaElse", s:purple, "", "bold")
  call <SID>X("luaCondElseif", s:purple, "", "bold")
  call <SID>X("luaCond", s:purple, "", "bold")
  call <SID>X("luaCondEnd", s:purple, "", "")

  " Plugin: Netrw
  call <SID>X("netrwVersion", s:red, "", "")
  call <SID>X("netrwList", s:pink, "", "")
  call <SID>X("netrwHidePat", s:olive, "", "")
  call <SID>X("netrwQuickHelp", s:blue, "", "")
  call <SID>X("netrwHelpCmd", s:blue, "", "")
  call <SID>X("netrwDir", s:aqua, "", "bold")
  call <SID>X("netrwClassify", s:pink, "", "")
  call <SID>X("netrwExe", s:green, "", "")
  call <SID>X("netrwSuffixes", s:comment, "", "")

  " Plugin: NERDTree
  call <SID>X("NERDTreeUp", s:comment, "", "")
  call <SID>X("NERDTreeHelpCommand", s:pink, "", "")
  call <SID>X("NERDTreeHelpTitle", s:blue, "", "bold")
  call <SID>X("NERDTreeHelpKey", s:pink, "", "")
  call <SID>X("NERDTreeHelp", s:foreground, "", "")
  call <SID>X("NERDTreeToggleOff", s:red, "", "")
  call <SID>X("NERDTreeToggleOn", s:green, "", "")
  call <SID>X("NERDTreeDir", s:aqua, "", "bold")
  call <SID>X("NERDTreeExecFile", s:green, "", "")

  " Plugin: Tagbar
  call <SID>X("TagbarHelpTitle", s:blue, "", "bold")
  call <SID>X("TagbarHelp", s:foreground, "", "")
  call <SID>X("TagbarKind", s:pink, "", "")
  call <SID>X("TagbarSignature", s:aqua, "", "")

  " Plugin: Vimdiff
  call <SID>X("DiffAdd",    s:diffadd_fg,    s:diffadd_bg,    "none")
  call <SID>X("DiffChange", s:diffchange_fg, s:diffchange_bg, "none")
  call <SID>X("DiffDelete", s:diffdelete_fg, s:diffdelete_bg, "none")
  call <SID>X("DiffText",   s:difftext_fg,   s:difftext_bg,   "none")

  " Plugin: Spell Checking
  call <SID>X("SpellBad",   s:foreground, s:spellbad,   "")
  call <SID>X("SpellCap",   s:foreground, s:spellcap,   "")
  call <SID>X("SpellRare",  s:foreground, s:spellrare,  "")
  call <SID>X("SpellLocal", s:foreground, s:spelllocal, "")

  "=====================================================================
  " SYNTAX HIGHLIGHTING CODE BELOW THIS LINE ISN'T TESTED FOR THIS THEME
  "=====================================================================


  " " CoffeeScript Highlighting
  " call <SID>X("coffeeRepeat", s:purple, "", "")
  " call <SID>X("coffeeConditional", s:purple, "", "")
  " call <SID>X("coffeeKeyword", s:purple, "", "")
  " call <SID>X("coffeeObject", s:yellow, "", "")


  " " ShowMarks Highlighting
  " call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
  " call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
  " call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
  " call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")


  " " Cucumber Highlighting
  " call <SID>X("cucumberGiven", s:blue, "", "")
  " call <SID>X("cucumberGivenAnd", s:blue, "", "")


  " " Clojure "highlighting
  " call <SID>X("clojureConstant", s:orange, "", "")
  " call <SID>X("clojureBoolean", s:orange, "", "")
  " call <SID>X("clojureCharacter", s:orange, "", "")
  " call <SID>X("clojureKeyword", s:olive, "", "")
  " call <SID>X("clojureNumber", s:orange, "", "")
  " call <SID>X("clojureString", s:olive, "", "")
  " call <SID>X("clojureRegexp", s:olive, "", "")
  " call <SID>X("clojureParen", s:aqua, "", "")
  " call <SID>X("clojureVariable", s:yellow, "", "")
  " call <SID>X("clojureCond", s:blue, "", "")
  " call <SID>X("clojureDefine", s:purple, "", "")
  " call <SID>X("clojureException", s:pink, "", "")
  " call <SID>X("clojureFunc", s:blue, "", "")
  " call <SID>X("clojureMacro", s:blue, "", "")
  " call <SID>X("clojureRepeat", s:blue, "", "")
  " call <SID>X("clojureSpecial", s:purple, "", "")
  " call <SID>X("clojureQuote", s:blue, "", "")
  " call <SID>X("clojureUnquote", s:blue, "", "")
  " call <SID>X("clojureMeta", s:blue, "", "")
  " call <SID>X("clojureDeref", s:blue, "", "")
  " call <SID>X("clojureAnonArg", s:blue, "", "")
  " call <SID>X("clojureRepeat", s:blue, "", "")
  " call <SID>X("clojureDispatch", s:blue, "", "")

  " " Scala "highlighting
  " call <SID>X("scalaKeyword", s:purple, "", "")
  " call <SID>X("scalaKeywordModifier", s:purple, "", "")
  " call <SID>X("scalaOperator", s:blue, "", "")
  " call <SID>X("scalaPackage", s:pink, "", "")
  " call <SID>X("scalaFqn", s:foreground, "", "")
  " call <SID>X("scalaFqnSet", s:foreground, "", "")
  " call <SID>X("scalaImport", s:purple, "", "")
  " call <SID>X("scalaBoolean", s:orange, "", "")
  " call <SID>X("scalaDef", s:purple, "", "")
  " call <SID>X("scalaVal", s:purple, "", "")
  " call <SID>X("scalaVar", s:aqua, "", "")
  " call <SID>X("scalaClass", s:purple, "", "")
  " call <SID>X("scalaObject", s:purple, "", "")
  " call <SID>X("scalaTrait", s:purple, "", "")
  " call <SID>X("scalaDefName", s:blue, "", "")
  " call <SID>X("scalaValName", s:foreground, "", "")
  " call <SID>X("scalaVarName", s:foreground, "", "")
  " call <SID>X("scalaClassName", s:foreground, "", "")
  " call <SID>X("scalaType", s:yellow, "", "")
  " call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
  " call <SID>X("scalaAnnotation", s:orange, "", "")
  " call <SID>X("scalaNumber", s:orange, "", "")
  " call <SID>X("scalaDefSpecializer", s:yellow, "", "")
  " call <SID>X("scalaClassSpecializer", s:yellow, "", "")
  " call <SID>X("scalaBackTick", s:olive, "", "")
  " call <SID>X("scalaRoot", s:foreground, "", "")
  " call <SID>X("scalaMethodCall", s:blue, "", "")
  " call <SID>X("scalaCaseType", s:yellow, "", "")
  " call <SID>X("scalaLineComment", s:comment, "", "")
  " call <SID>X("scalaComment", s:comment, "", "")
  " call <SID>X("scalaDocComment", s:comment, "", "")
  " call <SID>X("scalaDocTags", s:comment, "", "")
  " call <SID>X("scalaEmptyString", s:olive, "", "")
  " call <SID>X("scalaMultiLineString", s:olive, "", "")
  " call <SID>X("scalaUnicode", s:orange, "", "")
  " call <SID>X("scalaString", s:olive, "", "")
  " call <SID>X("scalaStringEscape", s:olive, "", "")
  " call <SID>X("scalaSymbol", s:orange, "", "")
  " call <SID>X("scalaChar", s:orange, "", "")
  " call <SID>X("scalaXml", s:olive, "", "")
  " call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
  " call <SID>X("scalaBackTick", s:blue, "", "")


  " Git
  call <SID>X("diffAdded", s:olive, "", "")
  call <SID>X("diffRemoved", s:pink, "", "")
  call <SID>X("gitcommitSummary", "", "", "bold")

  " Delete Functions
  delf <SID>X
  delf <SID>rgb
  delf <SID>colour
  delf <SID>rgb_colour
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_colour
  delf <SID>grey_level
  delf <SID>grey_number
endif
