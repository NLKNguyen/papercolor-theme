PaperColor Theme
===================
[![license](https://img.shields.io/github/license/NLKNguyen/papercolor-theme.svg?maxAge=2592000)](https://github.com/NLKNguyen/papercolor-theme/blob/master/LICENSE) [![](https://img.shields.io/github/issues-raw/NLKNguyen/papercolor-theme.svg?maxAge=2592000)](https://github.com/NLKNguyen/papercolor-theme/issues) [![](https://img.shields.io/github/issues-closed-raw/NLKNguyen/papercolor-theme.svg?maxAge=2592000)](https://github.com/NLKNguyen/papercolor-theme/issues) [![GitHub release](https://img.shields.io/github/release/NLKNguyen/papercolor-theme.svg)](https://github.com/NLKNguyen/papercolor-theme/releases) [![Travis CI Build Status](https://travis-ci.org/NLKNguyen/papercolor-theme.svg?branch=master)](https://travis-ci.org/NLKNguyen/papercolor-theme)


Light & Dark color schemes for **Vim** terminal editor and **gVim**

Inspired by Google's Material Design

Improve code readability; great for presentation

Currently designed for these file types:  Ada, C, C++, COBOL, Java, Makefile, CMake, Lex/Flex & Yacc/Bison, Bash, VimL, Golang, JavaScript, JSON, HTML, XML, Python, Ruby, Markdown, DTrace, SystemTap, PlantUML, Haskell, Assembly (MIPS, GAS, NASM), SQL/MySQL, Octave/MATLAB, Fortran, R, Pascal, PHP, Perl, LUA, Clojure, Dockerfile, NGINX, Yaml, Dosini, Mail, reStructuredText, Erlang, Elixir, Cucumber, Sed

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

## User-config Options

This theme currently provides theme options and language-specific options. All config options can be stored in global variable `g:PaperColor_Theme_Options` which can be set in your `.vimrc` 

### Theme Options

Within section `theme`, options for each theme can be specified under the theme name. The original PaperColor theme is `default`. For example:

```VimL
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
```

Or if you want to specify options only for a variant (dark or light) of a theme, you can specify using this pattern `[theme name].light` or `[theme name].dark`. For example:

```VimL
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
```
**Note**: 
+ This variable must be placed anywhere **before** `color PaperColor` command.
+ if the same option is provided in both a theme and a theme's variant, the value in the theme's variant options will take precedence. 

#### Currently available theme options

`transparent_background` set to 1 to use terminal background. Default is 0, use theme background



### Language-specific options

In general, for each language, built-in functions and constants are not highlighted.
This is intentional; the vim syntax file often lags behind actual language development.
To override the default behavior, optionally place a language section in `g:PaperColor_Theme_Options`.
An example configuration is available below, and will be updated as new languages are supported.


```VimL
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
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
* Elixir: [vim-elixir](https://github.com/elixir-lang/vim-elixir)


## Screenshots

**Default Light**

![Sample Ruby code](https://nlknguyen.files.wordpress.com/2015/05/ruby1.png)

![Sample DTrace code](https://nlknguyen.files.wordpress.com/2015/05/dtrace1.png)

![Sample MySQL code](https://nlknguyen.files.wordpress.com/2015/05/mysql.png)

![Sample Assembly code](https://nlknguyen.files.wordpress.com/2015/05/asm.png)

![Sample Vimdiff w/ git tool](https://cloud.githubusercontent.com/assets/4667129/24315492/9410c372-10a4-11e7-84c7-8846984bdca0.png)

**Default Dark**

![Sample Ruby code](https://nlknguyen.files.wordpress.com/2015/05/ruby-dark.png)

![Sample Go code](https://nlknguyen.files.wordpress.com/2015/05/go-dark.png)

![Sample JavaScript code](https://nlknguyen.files.wordpress.com/2015/05/javascript-dark2.png)

![Sample C code](https://nlknguyen.files.wordpress.com/2015/05/c-dark-split.png)

![Sample Vimdiff w/ git tool](https://cloud.githubusercontent.com/assets/4667129/24315493/94122816-10a4-11e7-8d3f-f5d92a064a14.png)


**Have screenshots to contribute?** Use [this thread](https://github.com/NLKNguyen/papercolor-theme/issues/90) to upload images and get direct links.

----

![Vim-airline support](https://nlknguyen.files.wordpress.com/2015/05/gifrecord_2015-05-31_010251.gif)

To set [vim-airline](https://github.com/bling/vim-airline) theme:

    let g:airline_theme='papercolor'

To set [lightline](https://github.com/itchyny/lightline.vim) theme:

    let g:lightline = { 'colorscheme': 'PaperColor' }

For more sceenshots, story behind the project, and other users' designs inspired by Paper Color, go to [this blog post](http://nlknguyen.com/2015/05/21/vim-paper-color-theme/)

Suggestions/Wishes/Questions/Comments are welcome via [Github issues](https://github.com/NLKNguyen/papercolor-theme/issues) or via the blog above.

# Related Projects Based On PaperColor
[Material iTerm](https://github.com/stoeffel/material-iterm) theme by Christoph Hermann

[Material Terminator](https://github.com/marhs/material-terminator) (terminal emulator) theme by Marco Herrero

[Terminal Theme](https://www.reddit.com/r/vim/comments/36xzbs/vim_paper_color_theme_inspired_by_googles/crqbfpa) by Fixles

[PaperColor Light for iTerm2](https://github.com/aseom/dotfiles/blob/master/osx/iterm2/papercolor-light.itermcolors) by ASeom Han

[PaperColor Theme for Vis Editor](https://github.com/jceb/dotfiles/blob/master/config/vis/lexers/themes/papercolor.lua) by Jan Christoph Ebersbach

[Airline PaperColor Theme for Emacs Powerline](https://github.com/AnthonyDiGirolamo/airline-themes) by Anthony DiGirolamo

[Airline PaperColor Theme for Vim Lightline](https://github.com/itchyny/lightline.vim)

[Ninrod's `vim + tmux + zsh` dotfiles](https://github.com/ninrod/dotfiles.git) by [Filipe Silva](https://github.com/ninrod)

[PaperColor for Vscode](https://github.com/Rozbo/papercolor-vscode) by [rozbo](https://github.com/rozbo)

[PaperColor theme for Hyper](https://github.com/rafaelrinaldi/hyper-papercolor) by [Rafael Rinaldi](https://github.com/rafaelrinaldi)

Feel free to add related projects here!
