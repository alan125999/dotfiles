" ======================================================= "
"                                                         "
"                      Alan's setting                     "
"                                                         "
" ======================================================= "



" ----------------------------------------------------------
" Load subscripts
" ----------------------------------------------------------

" Add my vim.d to runtimepath
let $MY_VIM_D = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vim.d'
let &runtimepath .= ',' . $MY_VIM_D

"" Source each scripts
"for file in split(glob($MY_VIM_D . '/*.vim'), '\n')
"    execute 'source' file
"endfor


