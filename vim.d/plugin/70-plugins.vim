" ======================================================== "
"               Third-Party Plugins Settings               "
" ======================================================== "


" ----------------------------------------------------------
" Lightline
" ----------------------------------------------------------
set noshowmode
let g:lightline = {
    \   'colorscheme': 'wombat',
    \   'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent' ],
    \                [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
    \   },
    \   'component': {
    \     'charvaluehex': '0x%B',
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head'
    \   },
    \ }

" ----------------------------------------------------------
" NERDTree
" ----------------------------------------------------------
let g:NERDTreeNodeDelimiter = "\u00a0"


" ----------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------
" Notes:
" For C-Family Semantic Completion, you need to generate
" compilation database for your project. 
"   macOS users can use "bear" to generate:
"     1. "brew install bear" to install.
"     2. When compile your project, add bear before your
"        build command. E.g. "bear make", "bear gcc a.c"
"
"     -  From Mojave, Apple remove "/usr/include", which
"        break many tools using POSIX path, including
"        bear.
"
"     -  You can prove this by running "clang -v" and
"        "bear clang -v".
"
"     *  To solve the problem, "echo | clang -v -E -x c++ -"
"        and look for "#include <...> search starts here:"
"        section.
"
"     *  Everytime you compile your project, you may need to
"        manually add "-isystem" arguments to specify those
"        path. E.g. bear gcc -isystem <path> \
"                            -isystem <path2> \
"                            ..... a.c
"
"     *  The other solution is to disable SIP and create a
"        link for /usr/include to real path of xcode SDK.
" ----------------------------------------------------------
let g:ycm_key_invoke_completion = '<leader>x'
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
highlight PMenu ctermfg=255 ctermbg=39
highlight PMenuSel ctermfg=15 ctermbg=45


" ----------------------------------------------------------
" vim-jsx-pretty
" ----------------------------------------------------------

" Colorful Style Flag
let g:vim_jsx_pretty_colorful_config = 1

" Highlight the close tag separately from the open tag
let g:vim_jsx_pretty_highlight_close_tag = 1


" ----------------------------------------------------------
" vim-code-dark
" ----------------------------------------------------------
colorscheme codedark
