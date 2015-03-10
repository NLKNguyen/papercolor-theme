" Theme: PaperColor 
" Author: Nguyen Nguyen (NLKNguyen@MSN.com)
" Origin: http://github.com/NLKNguyen/papercolor-theme.git
"
" Modified from the theme 'Tomorrow'

" Default GUI Colours
let s:foreground = "4d4d4c"
let s:background = "F5F5F5"
let s:selection = "d6d6d6"
let s:line = "efefef"
let s:comment = "8e908c"
let s:red = "df0000"
let s:pink = "d7005f"
let s:orange = "d75f00"
" let s:yellow = "f5871f"
" let s:yellow = "dfffaf"
let s:yellow = "ffff00"
let s:lemon = "008700"
let s:green = "718c00"
let s:aqua = "3e999f"
let s:blue = "4271ae"
let s:darkblue = "005f87"
let s:purple = "8959a8"
let s:window = "efefef"

set background=light
hi clear
syntax reset

let g:colors_name = "PaperColor"

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

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	" Vim Highlighting
	call <SID>X("Normal", s:foreground, s:background, "")
	highlight LineNr term=bold cterm=NONE ctermfg=grey ctermbg=NONE gui=NONE guifg=grey guibg=NONE
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:foreground, s:yellow, "")
	" call <SID>X("LineNr", s:aqua, s:background, "reverse")
	call <SID>X("TabLine", s:aqua, s:background, "reverse")
	call <SID>X("TabLineFill", s:darkblue, s:foreground, "reverse")
	call <SID>X("TabLineSel", s:window, s:foreground, "reverse")
	call <SID>X("StatusLine", s:window, s:darkblue, "bold")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", s:darkblue, s:background, "none")
	" call <SID>X("VertSplit", s:red, s:background, "none")
	call <SID>X("Visual", s:background, s:blue, "")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:pink, "", "")
	call <SID>X("MatchParen", "", s:selection, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("FoldColumn", "", s:background, "")
	if version >= 700
		call <SID>X("CursorLine", "", s:line, "none")
		call <SID>X("CursorColumn", "", s:line, "none")
		call <SID>X("PMenu", s:foreground, s:selection, "none")
		call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
		call <SID>X("SignColumn", "", s:background, "none")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
	end

	" Standard Highlighting
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:comment, s:background, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:pink, "", "none")
	call <SID>X("Statement", s:pink, "", "")
	call <SID>X("Label", s:blue, "", "")
	call <SID>X("Conditional", s:purple, "", "bold")
	call <SID>X("Repeat", s:purple, "", "bold")
" 	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Structure", s:blue, "", "bold")
	call <SID>X("Function", s:foreground, "", "")
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("Keyword", s:orange, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
" 	call <SID>X("PreProc", s:purple, "", "")
	call <SID>X("PreProc", s:blue, "", "")
	call <SID>X("Global", s:blue, "", "")
	call <SID>X("Operator", s:aqua, "", "none")
	call <SID>X("Type", s:pink, "", "bold")
	call <SID>X("Define", s:purple, "", "none")
	call <SID>X("Include", s:red, "", "")
	" call <SID>X("PreCondit", s:purple, "", "")
	call <SID>X("StorageClass", s:darkblue, "", "")


	" call <SID>X("Delimiter",s:blue, "", "")
	"call <SID>X("Ignore", "666666", "", "")
  
	" VimL Highlighting
	call <SID>X("vimCommand", s:pink, "", "none")
  call <SID>X("vimVar", s:darkblue, "", "")
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

  call <SID>X("vimSynType", s:green, "", "bold")
  call <SID>X("vimNotation", s:aqua, "", "")
  call <SID>X("vimOper", s:foreground, "", "")
  call <SID>X("vimOperParen", s:foreground, "", "")
  
  " Makefile Highlighting
	call <SID>X("makeIdent", s:blue, "", "")
	call <SID>X("makeSpecTarget", s:green, "", "")
	call <SID>X("makeTarget", s:red, "", "")
	call <SID>X("makeStatement", s:aqua, "", "bold")
	call <SID>X("makeCommands", s:foreground, "", "")
	call <SID>X("makeSpecial", s:orange, "", "bold")


	" call <SID>X("cppSTL",s:blue, "", "")
	" call <SID>X("cppAccess",s:purple, "", "")

	" C Highlighting
	call <SID>X("cType", s:pink, "", "bold")
	call <SID>X("cFormat", s:green, "", "bold")
	call <SID>X("cStorageClass", s:darkblue, "", "bold")

  call <SID>X("cBoolean", s:darkblue, "", "")
  call <SID>X("cCharacter", s:green, "", "")
  call <SID>X("cConstant", s:comment, "", "bold")
	call <SID>X("cConditional", s:purple, "", "bold")

  call <SID>X("cSpecial", s:green, "", "bold")
  call <SID>X("cDefine", s:blue, "", "")

  call <SID>X("cNumber", s:orange, "", "")
  call <SID>X("cPreCondit", s:aqua, "", "bold")
	call <SID>X("cRepeat", s:purple, "", "bold")
	call <SID>X("cLabel",s:aqua, "", "bold")
	call <SID>X("cAnsiFunction",s:foreground, "", "")
	" call <SID>X("cUserFunction",s:blue, "", "bold")
	" call <SID>X("cAnsiName",s:pink, "", "")
	call <SID>X("cDelimiter",s:blue, "", "")
	" call <SID>X("cBraces",s:foreground, "", "")
	" call <SID>X("cIdentifier",s:blue, s:pink, "")
	" call <SID>X("cSemiColon","", s:blue, "")
	call <SID>X("cOperator",s:aqua, "", "")
	" call <SID>X("cStatement",s:pink, "", "")
	call <SID>X("cFunction", s:foreground, "", "none")

  " call <SID>X("cStructure", s:blue, "", "bold")
  
	call <SID>X("Todo", s:foreground, "", "")

  " Lex highlighting
	call <SID>X("lexCFunctions", s:blue, "", "bold")
	call <SID>X("lexAbbrv", s:blue, "", "")
	call <SID>X("lexAbbrvRegExp", s:foreground, "", "")
	call <SID>X("lexAbbrvComment", s:comment, "", "")
	call <SID>X("lexBrace", s:darkblue, "", "bold")
	call <SID>X("lexPat", s:aqua, "", "bold")
	call <SID>X("lexPatComment", s:comment, "", "")
	" call <SID>X("lexPatTag", s:blue, "", "bold")
	" call <SID>X("lexPatBlock", s:foreground, "", "bold")
	call <SID>X("lexSlashQuote", s:foreground, "", "bold")
	call <SID>X("lexSep", s:foreground, "", "")
	call <SID>X("lexStartState", s:green, "", "bold")
	call <SID>X("lexPatTagZone", s:green, "", "bold")
	call <SID>X("lexMorePat", s:green, "", "bold")
	call <SID>X("lexOptions", s:green, "", "bold")
	call <SID>X("lexPatString", s:green, "", "")
  
  " Shell/Bash highlighting
	call <SID>X("bashStatement", s:foreground, "", "bold")
  call <SID>X("shDerefVar", s:aqua, "", "bold")
  call <SID>X("shDerefSimple", s:aqua, "", "")
  call <SID>X("shFunction", s:orange, "", "bold")
  call <SID>X("shStatement", s:foreground, "", "")
	call <SID>X("shLoop", s:purple, "", "bold")
	call <SID>X("shQuote", s:green, "", "")
  call <SID>X("shCaseEsac", s:aqua, "", "bold")
  call <SID>X("shSnglCase", s:purple, "", "none")
  call <SID>X("shFunctionOne", s:darkblue, "", "")
  call <SID>X("shCase", s:darkblue, "", "")

	" HTML Highlighting
	call <SID>X("htmlH1", s:orange, "", "bold")
	call <SID>X("htmlH2", s:aqua, "", "bold")
	call <SID>X("htmlH3", s:purple, "", "bold")
	call <SID>X("htmlH4", s:pink, "", "")
	call <SID>X("htmlTag", s:pink, "", "")
	call <SID>X("htmlTagName", s:pink, "", "")
	call <SID>X("htmlArg", s:pink, "", "")
	call <SID>X("htmlScriptTag", s:pink, "", "")
	call <SID>X("htmlBold", s:foreground, "", "bold")
	call <SID>X("htmlItalic", s:comment, "", "bold")
  call <SID>X("htmlBoldItalic", s:darkblue, "", "bold")

	" call <SID>X("htmlLink", s:blue, "", "bold")
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
	call <SID>X("pythonInclude", s:pink, "", "")
	call <SID>X("pythonStatement", s:pink, "", "")
	" call <SID>X("pythonOperator", s:blue, "", "bold")
	call <SID>X("pythonConditional", s:purple, "", "bold")
	call <SID>X("pythonRepeat", s:purple, "", "bold")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFunction", s:blue, "", "")
	call <SID>X("pythonPreCondit", s:purple, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")

	" JavaScript Highlighting
	" call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptParens", s:blue, "", "")
	call <SID>X("javaScriptFunction", s:blue, "", "bold")
	call <SID>X("javaScriptConditional", s:purple, "", "bold")
	call <SID>X("javaScriptRepeat", s:purple, "", "bold")
	" call <SID>X("javaScriptNumber", s:orange, "", "")
	" call <SID>X("javaScriptMember", s:orange, "", "")
	" call <SID>X("javascriptNull", s:orange, "", "")
	" call <SID>X("javascriptGlobal", s:blue, "", "")
	" call <SID>X("javascriptStatement", s:pink, "", "")


  " Systemtap Highlighting

	" call <SID>X("stapBlock", s:comment, "", "none")
	call <SID>X("stapComment", s:comment, "", "none")
	call <SID>X("stapProbe", s:blue, "", "")
	call <SID>X("stapStat", s:blue, "", "bold")
	call <SID>X("stapFunc", s:foreground, "", "")
	call <SID>X("stapString", s:green, "", "none")
	" call <SID>X("stapTarget", s:green, "", "none")
	call <SID>X("stapStatement", s:pink, "", "none")
	" call <SID>X("stapType", s:pink, "", "none")
	call <SID>X("stapSharpBang", s:comment, "", "none")
	call <SID>X("stapDeclaration", s:pink, "", "bold")
	call <SID>X("stapCMacro", s:blue, "", "none")
  

	" DTrace Highlighting 
  
	call <SID>X("dtraceProbe", s:blue, "", "")
	call <SID>X("dtracePredicate", s:purple, "", "bold")
	call <SID>X("dtraceComment", s:comment, "", "")
	call <SID>X("dtraceFunction", s:foreground, "", "")
	call <SID>X("dtraceAggregatingFunction", s:blue, "", "bold")
	call <SID>X("dtraceStatement", s:darkblue, "", "bold")
	call <SID>X("dtraceIdentifier", s:pink, "", "")
	call <SID>X("dtraceOption", s:pink, "", "")
	" call <SID>X("dtraceConstant", s:orange, "", "bold")
	call <SID>X("dtraceType", s:pink, "", "bold")

  " PlantUML Highlighting 
  call <SID>X("plantumlPreProc", s:orange, "", "bold")
  call <SID>X("plantumlTypeKeyword", s:blue, "", "bold")
  call <SID>X("plantumlDirectedOrVerticalArrowRL", s:pink, "", "")
  call <SID>X("plantumlDirectedOrVerticalArrowLR", s:pink, "", "")
  call <SID>X("plantumlKeyword", s:pink, "", "")
  call <SID>X("plantumlString", s:green, "", "") 

  " Haskell Highlighting
  call <SID>X("haskellType", s:aqua, "", "bold")
  call <SID>X("haskellIdentifier", s:orange, "", "bold")
  call <SID>X("haskellOperators", s:pink, "", "")
  call <SID>X("haskellWhere", s:foreground, "", "bold")
  call <SID>X("haskellDelimiter", s:aqua, "", "")
  call <SID>X("haskellImportKeywords", s:pink, "", "")
  call <SID>X("haskellStatement", s:purple, "", "bold")
  "=====================================================================
  " SYNTAX HIGHLIGHTING CODE BELOW THIS LINE ISN'T TESTED FOR THIS THEME
  "=====================================================================
  

	" PHP Highlighting
	call <SID>X("phpVarSelector", s:pink, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", s:green, "", "")
	call <SID>X("rubyConstant", s:yellow, "", "")
	call <SID>X("rubyAccess", s:yellow, "", "")
	call <SID>X("rubyAttribute", s:blue, "", "")
	call <SID>X("rubyInclude", s:blue, "", "")
	call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("rubyCurlyBlock", s:orange, "", "")
	call <SID>X("rubyStringDelimiter", s:green, "", "")
	call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
	call <SID>X("rubyConditional", s:purple, "", "")
	call <SID>X("rubyRepeat", s:purple, "", "")
	call <SID>X("rubyControl", s:purple, "", "")
	call <SID>X("rubyException", s:purple, "", "")


	" CoffeeScript Highlighting
	call <SID>X("coffeeRepeat", s:purple, "", "")
	call <SID>X("coffeeConditional", s:purple, "", "")
	call <SID>X("coffeeKeyword", s:purple, "", "")
	call <SID>X("coffeeObject", s:yellow, "", "")


	" ShowMarks Highlighting
	call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
	call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
	call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
	call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

	" Lua Highlighting
	call <SID>X("luaStatement", s:purple, "", "")
	call <SID>X("luaRepeat", s:purple, "", "")
	call <SID>X("luaCondStart", s:purple, "", "")
	call <SID>X("luaCondElseif", s:purple, "", "")
	call <SID>X("luaCond", s:purple, "", "")
	call <SID>X("luaCondEnd", s:purple, "", "")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call <SID>X("goDirective", s:red, "", "")
	call <SID>X("goDeclaration", s:blue, "", "bold")
	call <SID>X("goStatement", s:pink, "", "")
	call <SID>X("goConditional", s:purple, "", "bold")
	call <SID>X("goConstants", s:orange, "", "")
	call <SID>X("goFunction", s:orange, "", "")
	call <SID>X("goTodo", s:yellow, "", "")
	call <SID>X("goDeclType", s:blue, "", "")
	call <SID>X("goBuiltins", s:purple, "", "")

	" Clojure "highlighting
	call <SID>X("clojureConstant", s:orange, "", "")
	call <SID>X("clojureBoolean", s:orange, "", "")
	call <SID>X("clojureCharacter", s:orange, "", "")
	call <SID>X("clojureKeyword", s:green, "", "")
	call <SID>X("clojureNumber", s:orange, "", "")
	call <SID>X("clojureString", s:green, "", "")
	call <SID>X("clojureRegexp", s:green, "", "")
	call <SID>X("clojureParen", s:aqua, "", "")
	call <SID>X("clojureVariable", s:yellow, "", "")
	call <SID>X("clojureCond", s:blue, "", "")
	call <SID>X("clojureDefine", s:purple, "", "")
	call <SID>X("clojureException", s:pink, "", "")
	call <SID>X("clojureFunc", s:blue, "", "")
	call <SID>X("clojureMacro", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureSpecial", s:purple, "", "")
	call <SID>X("clojureQuote", s:blue, "", "")
	call <SID>X("clojureUnquote", s:blue, "", "")
	call <SID>X("clojureMeta", s:blue, "", "")
	call <SID>X("clojureDeref", s:blue, "", "")
	call <SID>X("clojureAnonArg", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureDispatch", s:blue, "", "")

	" Scala "highlighting
	call <SID>X("scalaKeyword", s:purple, "", "")
	call <SID>X("scalaKeywordModifier", s:purple, "", "")
	call <SID>X("scalaOperator", s:blue, "", "")
	call <SID>X("scalaPackage", s:pink, "", "")
	call <SID>X("scalaFqn", s:foreground, "", "")
	call <SID>X("scalaFqnSet", s:foreground, "", "")
	call <SID>X("scalaImport", s:purple, "", "")
	call <SID>X("scalaBoolean", s:orange, "", "")
	call <SID>X("scalaDef", s:purple, "", "")
	call <SID>X("scalaVal", s:purple, "", "")
	call <SID>X("scalaVar", s:aqua, "", "")
	call <SID>X("scalaClass", s:purple, "", "")
	call <SID>X("scalaObject", s:purple, "", "")
	call <SID>X("scalaTrait", s:purple, "", "")
	call <SID>X("scalaDefName", s:blue, "", "")
	call <SID>X("scalaValName", s:foreground, "", "")
	call <SID>X("scalaVarName", s:foreground, "", "")
	call <SID>X("scalaClassName", s:foreground, "", "")
	call <SID>X("scalaType", s:yellow, "", "")
	call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
	call <SID>X("scalaAnnotation", s:orange, "", "")
	call <SID>X("scalaNumber", s:orange, "", "")
	call <SID>X("scalaDefSpecializer", s:yellow, "", "")
	call <SID>X("scalaClassSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:green, "", "")
	call <SID>X("scalaRoot", s:foreground, "", "")
	call <SID>X("scalaMethodCall", s:blue, "", "")
	call <SID>X("scalaCaseType", s:yellow, "", "")
	call <SID>X("scalaLineComment", s:comment, "", "")
	call <SID>X("scalaComment", s:comment, "", "")
	call <SID>X("scalaDocComment", s:comment, "", "")
	call <SID>X("scalaDocTags", s:comment, "", "")
	call <SID>X("scalaEmptyString", s:green, "", "")
	call <SID>X("scalaMultiLineString", s:green, "", "")
	call <SID>X("scalaUnicode", s:orange, "", "")
	call <SID>X("scalaString", s:green, "", "")
	call <SID>X("scalaStringEscape", s:green, "", "")
	call <SID>X("scalaSymbol", s:orange, "", "")
	call <SID>X("scalaChar", s:orange, "", "")
	call <SID>X("scalaXml", s:green, "", "")
	call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:blue, "", "")

	" Git
	call <SID>X("diffAdded", s:green, "", "")
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
