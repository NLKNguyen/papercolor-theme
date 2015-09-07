PaperColor Theme
===================
Light & Dark color schemes for **Vim** terminal editor and **gVim**

Inspired by Google's Material Design

Improve code readability; great for presentation

Currently designed for these file types:  C, C++, Makefile, CMake, Lex/Flex & Yacc/Bison, Bash, VimL, Golang, JavaScript, JSON, Python, Ruby, Markdown, DTrace, SystemTap, PlantUML, Haskell, Assembly (MIPS, GAS, NASM), SQL/MySQL, Octave/MATLAB, Fortran, R, PHP, Perl, LUA, Clojure, Dockerfile, NGINX, Yaml, Dosini, Mail

Other file types can still display well as long as your Vim is set up to recognize the language syntax even though that may not be the optimal experience. So, if the language you are working on isn't listed here, feel free to make a design request.

Plugin support: vimdiff, netrw, [NERDTree](https://github.com/scrooloose/nerdtree), [tagbar](https://github.com/majutsushi/tagbar), [tabline](https://github.com/mkitt/tabline.vim), [vim-airline](https://github.com/bling/vim-airline), [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides), [vim-startify](https://github.com/mhinz/vim-startify)

(see below for syntax-highlighting plugins target)

## Installation
Place 'PaperColor.vim' file into 'colors' folder within your Vim directory, e.g. `~/.vim/colors/`

Or simply use a plugin manager like [Vundle](https://github.com/gmarik/Vundle.vim) (recommended for easy `:PluginUpdate`):

    Plugin 'NLKNguyen/papercolor-theme'

Then, put this in your `~/.vimrc`

```VimL
set t_Co=256   " This is may or may not needed.

set background=light
colorscheme PaperColor
```

Or using the dark version: 

```VimL
set background=dark
colorscheme PaperColor
```

To switch to dark or light variant during session: `:set background=dark` or `:set background=light`

To quickly toggle between them, use [vim-unimpaired](https://github.com/tpope/vim-unimpaired)'s keymap `cob`

*Optional*: turn on line numbers and status bar

```VimL
set number
set laststatus=2
```

##Highlighting Customization
Some elements have default highlighting color that may not fit everyone, and you can customize their HEX color code in your .vimrc file.
Refer to 256-color table when choosing color.

Example of currently available options:

```VimL
let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
```

## Syntax Highlighting Plugins Target
There are syntax highlighting enhancement plugins that improve upon Vim built-in syntax highlighting, and each can have many different implementations. This is the list of plugins that this color scheme targets.

* C: [c-syntax.vim](https://github.com/NLKNguyen/c-syntax.vim)
* JavaScript: [vim-javascript](https://github.com/pangloss/vim-javascript)
* JSON: [vim-json](https://github.com/elzr/vim-json)
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
* Dockerfile: [dockerfile.vim](https://github.com/docker/docker/tree/master/contrib/syntax/vim)
* NGINX: [nginx-vim-syntax](https://github.com/evanmiller/nginx-vim-syntax)


## Screenshots

![Sample Ruby code](https://nlknguyen.files.wordpress.com/2015/05/ruby1.png)

![Sample DTrace code](https://nlknguyen.files.wordpress.com/2015/05/dtrace1.png)

![Sample MySQL code](https://nlknguyen.files.wordpress.com/2015/05/mysql.png)

![Sample Assembly code](https://nlknguyen.files.wordpress.com/2015/05/asm.png)

*Note*: The background of the dark color scheme was brightened a bit to reduce contrast after these following screenshots were taken.

![Sample Ruby code](https://nlknguyen.files.wordpress.com/2015/05/ruby-dark.png)

![Sample Go code](https://nlknguyen.files.wordpress.com/2015/05/go-dark.png)

![Sample JavaScript code](https://nlknguyen.files.wordpress.com/2015/05/javascript-dark2.png)

![Sample C code](https://nlknguyen.files.wordpress.com/2015/05/c-dark-split.png)

![Vim-airline support](https://nlknguyen.files.wordpress.com/2015/05/gifrecord_2015-05-31_010251.gif)

To set [vim-airline](https://github.com/bling/vim-airline) theme:

    let g:airline_theme='PaperColor'

To set [lightline](https://github.com/itchyny/lightline.vim) theme:

    let g:lightline = { 'colorscheme': 'PaperColor' }

For more sceenshots, story behind the project, and other users' designs inspired by Paper Color, go to [this blog post](http://nlknguyen.com/2015/05/21/vim-paper-color-theme/)

Suggestions/Wishes/Questions/Comments are welcome via [Github issues](https://github.com/NLKNguyen/papercolor-theme/issues) or via the blog above.
