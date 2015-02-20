PaperColor Theme
===================
Light  color scheme for **Vim** terminal editor

Inspired by Google's Material Design

Improve code readability; great for presentation

Currently designed for these languages:  C, Makefile, Lex/Flex, Bash, VimL, Golang, JavaScript, Python, Markdown, DTrace, SystemTap

Other languages can still work as long as your Vim is set up to recognize the language syntax.

## Installation
Place 'PaperColor.vim' file into 'colors' folder within your Vim directory, e.g. `~/.vim/colors/`

Then, put this in your `~/.vimrc`

    set t_Co=256
    colorscheme PaperColor
*Optional*: turn on line numbers and status bar

    set number
    set laststatus=2

## Screenshots
**Note**: Since web browsers render images differently, the actual background color of the theme may look brighter in Vim than what you see below.

Sample **C** code with syntax highlighting enhanced using [Vim-Syntax-Extra](https://github.com/justinmk/vim-syntax-extra)
![Sample C code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/C.1.png)

![Sample C code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/C.2.png)



**Go(Golang)** with [Vim.go](https://github.com/fatih/vim-go)
![Sample Go code](https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/screenshots/Go.png)
