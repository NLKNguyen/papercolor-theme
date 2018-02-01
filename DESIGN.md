Design Guideline
================

This note explains how to override theme colors and create your own theme on top of PaperColor as well as the full list of color names and the format of color values.

1. Customize current theme colors
2. Create your own theme
3. Color Format
4. Color Names

# Customize Current Theme Colors

You can override any color of the theme of interest. This example is for `default` theme (original PaperColor Theme), but you can specify any other theme that is registered.

The overriding setting is placed in `override` key of `g:PaperColor_Theme_Options` variable that you set in `.vimrc` like this.

```VimL
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': { 
  \       'override' : {
  \         'color00' : ['#080808', '232'],
  \         'linenumber_bg' : ['#080808', '232']
  \       }
  \     }
  \   }
  \ }

```

In this case, `default` is color theme name, and `dark` is the specific variant that we want to override some colors. The other is `light`, and you can set the same way.

All colors can be overridden within `override` key. See Color Names section for all available options.

# Create your own theme

You can create your own theme on top of PaperColor. Your custom theme is simply responsible for color palette specification, similar to how the default theme specifies the colors. Think of this like a plugin for PaperColor framework. You can distribute your theme as a plugin that depends on PaperColor, and users need to install both. Your theme benefits from all development in PaperColor that occurs independently.  

Example: https://github.com/NLKNguyen/papercolor-blue

Disclaimer: This feature is very new and important, and I expect many revisions to get it right, so keep in mind of incompatible changes in future.

TODO: more instruction


# Color Format


The format of color value is `[GUI-Color, 256-Color]` where each item is a quoted string.

* `GUI-Color` is used for Vim variants that can display GUI Color such as MacVim, GVim, or NeoVim. The value format is Red-Green-Blue in hexadecimal, i.e. `'#RRGGBB'`
* `256-Color` is used for terminal Vim. The value format is from `'00'` to `'255'` in base 10 number system. 

You only have to provide one of them; for example, `['#080808', '']` or `['', '232']`, and  the theme will automatically convert as needed.
 
256-color can be converted exactly to their GUI color representation. The reverse is not necessary true. 256-color can only represent a very small subset of GUI-color, so for the GUI color outside 256-color range, the converter can only approximate the nearest 256-color of the GUI-color.
 
This is a [256-color table](http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html) and their corresponding GUI-color.


# Color Names

## Standard

16 standard colors are the required for all themes. These are also the falling-back colors for all extended colors if not provided.

name    | note
--------|-----------
color00 | background (main)
color01 | *negative* (should be red)
color02 | *positive* (should be green)
color03 | string 
color04 | *neutral* (2nd background)
color05 | comment
color06 | typically storage class keywords
color07 | foreground (normal text)
color08 | 3rd background
color09 | typically import/try-catch keywords
color10 | typically type and more emphasized  keywords
color11 | typically if/conditional/loop keywords
color12 | accent (rarely used)
color13 | typically number
color14 | typically the rest of keywords
color15 | highlight

## Extended Colors

All of these are optional but better be utilized for theme richness.

name                   | note
--------               | -----------
color16                | certain keywords where otherwise just color14
color17                | typically boolean and label/tag
cursor_fg              |
cursor_bg              |
cursorline             |
cursorcolumn           |
cursorlinenr_fg        |
cursorlinenr_bg        |
popupmenu_fg           |
popupmenu_bg           |
search_fg              |
search_bg              |
linenumber_fg          |
linenumber_bg          |
vertsplit_fg           |
vertsplit_bg           |
statusline_active_fg   |
statusline_active_bg   |
statusline_inactive_fg |
statusline_inactive_bg |
todo_fg                |
todo_bg                |
error_fg               |
error_bg               |
matchparen_bg          |
matchparen_fg          |
visual_fg              |
visual_bg              |
folded_fg              |
folded_bg              |
wildmenu_fg            |
wildmenu_bg            |
spellbad               |
spellcap               |
spellrare              |
spelllocal             |
diffadd_fg             |
diffadd_bg             |
diffdelete_fg          |
diffdelete_bg          |
difftext_fg            |
difftext_bg            |
diffchange_fg          |
diffchange_bg          |

For tabline plugin

name                   | note
--------               | -----------
tabline_bg             |
tabline_active_fg      |
tabline_active_bg      |
tabline_inactive_fg    |
tabline_inactive_bg    |

For vim-buftabline plugin

name                   | note
--------               | -----------
buftabline_bg          |
buftabline_current_fg  |
buftabline_current_bg  |
buftabline_active_fg   |
buftabline_active_bg   |
buftabline_inactive_fg |
buftabline_inactive_bg |

