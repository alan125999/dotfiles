" ======================================================== "
"                          General                         "
" ======================================================== "


" ---------------------------------------------------------
" Detect File Type, and auto load plugins and indent rules
" for the filetype.
" 偵測檔案類型，並自動讀取該檔案類型的插件與縮排規則
" ---------------------------------------------------------
" Notes:
" 偵測檔案類別： filetype on
" 依據偵測的類別，啟用相關的 plugins： filetype plugin
" 依據偵測的類別，使用不同縮排的規則： filetype indent
" ---------------------------------------------------------
filetype plugin indent on

" ======================================================== "
"               Settings Depend on Filetype                "
" ======================================================== "


" Indent
autocmd FileType html,javascript,javascriptreact,python
    \ setlocal shiftwidth=2 softtabstop=2


" Formatter
autocmd FileType javascript setlocal formatprg=prettier
autocmd FileType javascript.jsx setlocal formatprg=prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType html setlocal formatprg=js-beautify\ --type\ html
autocmd FileType scss setlocal formatprg=prettier\ --parser\ css
autocmd FileType css setlocal formatprg=prettier\ --parser\ css

" ======================================================== "
"                        Completion                        "
" ======================================================== "
set omnifunc=syntaxcomplete#Complete
