PaperColor Theme
===================
Light  color scheme for **Vim** terminal editor

Inspired by Google's Material Design

Improve code readability; great for presentation

Currently designed for these languages:  C, Makefile, Lex/Flex & Yacc/Bison, Bash, VimL, Golang, JavaScript, Python, Markdown, DTrace, SystemTap, PlantUML, Haskell, Assembly (NASM, MIPS)

Other languages can still work as long as your Vim is set up to recognize the language syntax.

## Installation
Place 'PaperColor.vim' file into 'colors' folder within your Vim directory, e.g. `~/.vim/colors/`

Then, put this in your `~/.vimrc`

    set t_Co=256
    colorscheme PaperColor
*Optional*: turn on line numbers and status bar

    set number
    set laststatus=2

## Syntax Highlighting Plugin Targets
There are syntax highlighting enhancement plugins that improve upon Vim built-in syntax highlighting, and there are many different implementations of each. This is the list of plugins that this color scheme targets.

* C, Flex, Bison: [Vim Syntax Extra](https://github.com/justinmk/vim-syntax-extra)
* C++, STL: [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* Go: [Vim Go](https://github.com/fatih/vim-go)
* DTrace: [DTrace Syntax File](https://github.com/vim-scripts/dtrace-syntax-file)
* SystemTap: [Vim SystemTap](https://github.com/nickhutchinson/vim-systemtap)
* Haskell: [Haskell Vim](https://github.com/raichoo/haskell-vim)
* PlantUML: [PlantUML Syntax](https://github.com/aklt/plantuml-syntax)
* Markdown: [Vim Markdown](https://github.com/plasticboy/vim-markdown)
* Assembly MIPS: [MIPS](https://github.com/vim-scripts/mips.vim)


## Screenshots
**Note**: Since web browsers render images differently, the actual background color of the theme may look brighter in Vim than what you see below. Also, these screenshots are currently outdated. New screenshots will come soon.

Sample **C** code with syntax highlighting enhanced using [Vim-Syntax-Extra](https://github.com/justinmk/vim-syntax-extra)
![Sample C code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/C.1.png)

![Sample C code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/C.2.png)



**Go(Golang)** with [Vim.go](https://github.com/fatih/vim-go)
![Sample Go code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/Go.png)
