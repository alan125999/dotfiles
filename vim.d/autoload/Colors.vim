" ======================================================== "
"                    Highlight Override                    "
" -------------------------------------------------------- "
" Notes:                                                   "
"   必須放在 colorscheme 之後，因為 colorscheme 指令其實就 "
"   是 load 一個寫了一堆 highlight 參數的 vim script。     "
"                                                          "
"   因此放在其後才能 override。                            "
"                                                          "
"   由於安裝了 vim-code-dark 為了確保讀取順序為:           "
"       load plugin > load scheme > load override rules    "
"   決定將 highlight override 寫成 autoload function       "
"   需要時隨時調用即可。
" ======================================================== "


" ----------------------------------------------------------
" Tab Line
" ----------------------------------------------------------

function Colors#HiTabLine()
    highlight TabLine      cterm=NONE ctermfg=white ctermbg=238
    highlight TabLineSel   cterm=bold ctermfg=white ctermbg=33
    highlight TabLineFill             ctermfg=236   ctermbg=236
endfunction


" ----------------------------------------------------------
" Editor
" ----------------------------------------------------------

function Colors#HiEditor()

    " Crosshair
    highlight CursorLine   cterm=bold ctermbg=238
    highlight CursorLineNr cterm=bold ctermbg=238
    highlight CursorColumn cterm=bold ctermbg=238

    " Folding
    highlight FoldColumn   ctermfg=33 ctermbg=236

    " Completion Menu
    highlight PMenu    ctermfg=255 ctermbg=39
    highlight PMenuSel ctermfg=15  ctermbg=45

endfunction


" ----------------------------------------------------------
" Command Line
" ----------------------------------------------------------
function Colors#HiCmdLine()
    highlight WarningMsg   term=standout ctermfg=202
endfunction


" ----------------------------------------------------------
" Status Line
" ----------------------------------------------------------
function Colors#HiStatusLine()
    highlight StatusLine   cterm=bold ctermfg=255 ctermbg=33
endfunction


" ----------------------------------------------------------
" Wrap all
" ----------------------------------------------------------
function Colors#HiAll()
    call Colors#HiTabLine()
    call Colors#HiEditor()
    call Colors#HiCmdLine()
    call Colors#HiStatusLine()
endfunction

