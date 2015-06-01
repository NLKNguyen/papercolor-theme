PaperColor Theme
===================
Light color scheme for **Vim** terminal editor and **gVim**

Inspired by Google's Material Design

Improve code readability; great for presentation

Currently designed for these languages:  C, C++, Makefile, CMake, Lex/Flex & Yacc/Bison, Bash, VimL, Golang, JavaScript, Python, Ruby, Markdown, DTrace, SystemTap, PlantUML, Haskell, Assembly (MIPS, GAS, NASM), SQL/MySQL, Octave/MATLAB, Fortran, R

Other languages can still display well as long as your Vim is set up to recognize the language syntax even though that may not be the optimal experience. So, if the language you are working on isn't listed here, feel free to make a design request.

Plugin support: Netrw, NERDTree, Tagbar, Tabline, Vimdiff, Vim-Airline

(see below for syntax-highlighting plugins target)

## Installation
Place 'PaperColor.vim' file into 'colors' folder within your Vim directory, e.g. `~/.vim/colors/`

Or simply use a plugin manager like [Vundle](https://github.com/gmarik/Vundle.vim) (recommended for easy update):

    Plugin 'NLKNguyen/papercolor-theme'

Then, put this in your `~/.vimrc`

    set t_Co=256
    colorscheme PaperColor

*Optional*: turn on line numbers and status bar

    set number
    set laststatus=2

## Syntax Highlighting Plugins Target
There are syntax highlighting enhancement plugins that improve upon Vim built-in syntax highlighting, and each can have many different implementations. This is the list of plugins that this color scheme targets.

* C: [c-syntax.vim](https://github.com/NLKNguyen/c-syntax.vim)
* C++, STL: [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* Go: [vim-go](https://github.com/fatih/vim-go)
* DTrace: [dtrace-syntax-file](https://github.com/vim-scripts/dtrace-syntax-file)
* SystemTap: [vim-systemtap](https://github.com/nickhutchinson/vim-systemtap)
* Haskell: [haskell-vim](https://github.com/raichoo/haskell-vim)
* PlantUML: [plantuml-syntax](https://github.com/aklt/plantuml-syntax)
* Markdown: [vim-markdown](https://github.com/plasticboy/vim-markdown)
* Assembly MIPS: [mips](https://github.com/vim-scripts/mips.vim)
* Assembly GAS: [vim-gas](https://github.com/Shirk/vim-gas)
* Octave/MATLAB: [vim-octave](https://github.com/jvirtanen/vim-octave)
* Python: [python-syntax](https://github.com/hdima/python-syntax/)


## Screenshots

![Sample Ruby code](https://nlknguyen.files.wordpress.com/2015/05/ruby2.png)

![Sample C/C++ code](https://nlknguyen.files.wordpress.com/2015/05/c_cpp2.png)

![Sample DTrace code](https://nlknguyen.files.wordpress.com/2015/05/dtrace1.png)

![Sample Assembly code](https://nlknguyen.files.wordpress.com/2015/05/asm.png)

![Vim-airline support](https://nlknguyen.files.wordpress.com/2015/05/gifrecord_2015-05-31_010251.gif)
To set [vim-airline](https://github.com/bling/vim-airline) theme:

    let g:airline_theme='papercolor'


For more sceenshots, story behind the project, and other users' designs inspired by Paper Color, go to [this blog post](http://nlknguyen.com/2015/05/21/vim-paper-color-theme/)

Suggestions/Wishes/Questions/Comments are welcome via [Github issues](https://github.com/NLKNguyen/papercolor-theme/issues) or via the blog above.
