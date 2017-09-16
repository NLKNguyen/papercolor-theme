Design Guideline
================

This note explains the meaning of color names and suggestions for theme customization or new theme designing.

1. Customize current theme colors
2. Create your own theme


# 1. Customize Current Theme Colors

You can override any color of the theme of interest. In this note, the theme of interest is `default` (PaperColor Theme), but you can specify any other theme that is registered.

The overriding setting is located in `g:PaperColor_Theme_Options` variable that you set in `.vimrc` like this.

```VimL
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': { 
  \       'override' : {
  \       }
  \     }
  \   }
  \ }

```
`default` is color theme name, and `dark` is the specific variant that we want to override some colors. The other is `light`, and you can set that similarly.

All colors can be overridden within `override` dictionary:

// TODO: list colors and meaning


# 2. Create your own theme

// TODO: later