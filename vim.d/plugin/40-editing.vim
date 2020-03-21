" ======================================================== "
"                         Motions                          "
" ======================================================== "


" ----------------------------------------------------------
" Enable mouse control
" 啟用滑鼠操作
" ----------------------------------------------------------
" set mouse=a


" ----------------------------------------------------------
" Set key that can move arround lines by left/right.
" 設定左右移動能跳行的按鍵
" ----------------------------------------------------------
" set whichwrap+=<,>,h,l


" ----------------------------------------------------------
" Show matching bracket while typing closing bracket.
" 輸入括號時，顯示先前的對應括號
" ----------------------------------------------------------
" Notes:
"   showmatch: 當輸入成對括號時，將游標跳回對應括號的位置，
"              接著再跳回來。
"
"   matchtime: 設定跳轉停留時間，以 0.1 秒為單位。
" ----------------------------------------------------------
set showmatch
set matchtime=1


" ----------------------------------------------------------
" Restore the cursor position in the file closed last time
" 回覆游標到上一次關閉檔案位置
" ----------------------------------------------------------
function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END



" ======================================================== "
"                          Indent                          "
" ======================================================== "


" ----------------------------------------------------------
" Set the number of spaces that a <Tab> should be shown as.
" 設定 Tab 字元要顯示成多少空格的寬度
" ----------------------------------------------------------
" Notes:
" 由於 <tab> 普遍採用的寬度是 8，因此不建議修改此值，以免在
" 與他人/其他編輯器交換資料時造成排版混亂。
"
" 但由於程式縮排時 8 格寬普遍被認為太長了，為了解決此問題
" ， VIM 提供 softtab ，詳見 'softtabstop' 設定。
" ----------------------------------------------------------
" set tabstop=4


" ----------------------------------------------------------
" Use spaces for indent instead of <tab>
" 用空格縮排而不是 Tab
" ----------------------------------------------------------
set expandtab


" ----------------------------------------------------------
" The width should be shift while using '>' , '<'
" 用 '<', '>' 縮排時，要 shift 的寬度
" ----------------------------------------------------------
set shiftwidth=4


" ----------------------------------------------------------
" The width of spaces should be insert while using <Tab>
" 按下 <Tab> 縮排時，要插入多少寬度的空格
" ----------------------------------------------------------
" Notes:
" softtab 可理解為虛擬 <tab>。
" 當 softtabstop 不為 0 時表示啟用 softtab 功能，當按下
" <tab> 時不會直接插入真的 <tab>，而是採用 <tab> 與空格混合
" 縮排來達到指定的寬度。
"
" softtab 會自動使用最少的空格與最多的 <Tab> 來縮排，如：
"   setlocal tabstop=8 softtabstop=4
"   按下第一次 <tab> : ....Text
"   按下第二次 <tab> : >-------Text
"   按下第三次 <tab> : >-------....Text
"
" 如此可以便利的指定縮排寬度，且不需要改變 tabstop 的值。
" 若有使用 expandtab ，則將全部使用空格縮排。
" ----------------------------------------------------------
set softtabstop=4


" Enable Auto Indentation (There are 3 different modes)
" 設定自動縮排
set autoindent
set smartindent
"set cindent


" Be smart when using tabs ;)
set smarttab



" ======================================================== "
"               Special Characters Handling                "
" ======================================================== "


" ----------------------------------------------------------
" Show Hidden Characters
" 顯示隱藏字元
" ----------------------------------------------------------
set list


" ----------------------------------------------------------
" Set Replace Format for Hidden Characters
" 設定要顯示的隱藏字元，及用於顯示的替換字元
" ----------------------------------------------------------
set listchars=tab:>-,trail:.


" ----------------------------------------------------------
" Set which charactors can be deleted by backspace
" 設定退格鍵可以刪除的字元
" ----------------------------------------------------------
" Notes:
"   value 0: same as ":set backspace=" (Vi compatible)
"   value 1: same as ":set backspace=indent,eol"
"   value 2: same as ":set backspace=indent,eol,start"
"
"   如果按退格鍵沒有用:
"     1. 如果按下退格鍵出現 ^? ，應檢查 TERM 環境變數有沒有
"        設置正確，接著檢查 stty erase 是否為 ^?
"
"          顯示 stty 設定: stty -a
"          設定 erase:     stty erase ^?
"                          此處 ^? 不是直接輸入 ^?，而是按下
"                          <CTRL-V><CTRL-SHIFT-/>
"
"        不過一般來說除非用了很特殊的終端機，不然不會發生問
"        題，應此比起強制設定 TERM 與 stty，更應檢查有沒有在
"        bashrc 中亂改到這些值。
"
"     2. 先檢查有沒有設定 vi 相容模式，相容模式下退格鍵無效
"        關閉相容模式: set nocompatible
"
"     3. 設定 backspace 變數
" ----------------------------------------------------------
set backspace=2


" ----------------------------------------------------------
" Delete trailing white space on save, useful for some filetypes ;)
" ----------------------------------------------------------
function! StripFile()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

augroup stripFile
    autocmd!
    autocmd BufWritePre *.js,*.py,*.sh,*.c :call StripFile()
augroup END



" ======================================================== "
"                       Key Mappings                       "
" ======================================================== "


" ----------------------------------------------------------
" HARD Mode:
" Arrow Keys -> Switch among windows
" ----------------------------------------------------------
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
inoremap <Right> <ESC><C-w>la
inoremap <Left> <ESC><C-w>ha
inoremap <Up> <ESC><C-w>ka
inoremap <Down> <ESC><C-w>ja



" ======================================================== "
"                      Custom Command                      "
" ======================================================== "


" ----------------------------------------------------------
" Write with sudo
" ----------------------------------------------------------
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
