" ======================================================= "
"                                                         "
"                      Alan's setting                     "
"                                                         "
" ======================================================= "


" ----------------------------------------------------------
" Add Runtime
" ----------------------------------------------------------
" Notes:
"   I seperate all config into files, following runtime
"   folder structure.
"
"   E.g.
"       - plugin:   all *.vim in here will be loaded.
"       - autoload: the *.vim in here will only be load on
"                   fly
"       - color:    colorscheme goes here
"
"   All runtimepath should be added here because vim will
"   only load them once after vimrc is loaded.
" ----------------------------------------------------------


" Add my vim.d to runtimepath
let $MY_VIM_D = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vim.d'
let &runtimepath .= ',' . $MY_VIM_D

" Load flags
execute 'source' $MY_VIM_D . '/flag.vim'

" Load plugins managed by vim-plug
execute 'source' $MY_VIM_D . '/load-plugins.vim'

"" Source each scripts in folder
"for file in split(glob($MY_VIM_D . '/*.vim'), '\n')
"    execute 'source' file
"endfor



