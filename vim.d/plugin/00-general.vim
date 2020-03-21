" ======================================================== "
"             General or Miscellaneous Settings            "
" ======================================================== "


" ---------------------------------------------------------
" Disable Vi Compatible
" 關閉 Vi 相容模式
" ---------------------------------------------------------
set nocompatible


" ---------------------------------------------------------
" Sets how many lines of history VIM has to remember
" 設定 VIM command 的歷史紀錄要保留多少筆
" ---------------------------------------------------------
set history=10000


" ---------------------------------------------------------
" Tell vim to remember certain things when we exit
" ---------------------------------------------------------
" Notes:
"   Required by RestoreCursor.
"   Viminfo is used to store history, variables.
"   The default value depends on the operating system.
"   Only change it if RestoreCursor not work properly.
"   Viminfo requires +viminfo parameters while compilation.
" ---------------------------------------------------------
" set viminfo='100,<50,s10,h


" ---------------------------------------------------------
" Auto reload the file when it might be changed after
" running shell commands.
" ---------------------------------------------------------
" set autoread


" ---------------------------------------------------------
" Turn backup off
" ---------------------------------------------------------
" set nobackup
" set nowritebackup
" set noswapfile


" ---------------------------------------------------------
" For better performance, do not redraw during executing
" marcos.
" ---------------------------------------------------------
set lazyredraw


" ---------------------------------------------------------
" Hide buffers instead of closing them.
" ---------------------------------------------------------
" This means that you can have unwritten changes to a file
" and open a new file using :e, without being forced to
" write or undo your changes first.
"
" Also, undo buffers and marks are preserved while the
" buffer is open.
" ---------------------------------------------------------
set hidden


" ---------------------------------------------------------
" Enable modeline
" ---------------------------------------------------------
" Exexute modeline (file specific settings ) in files.
" 'set nocompatible' will set modeline enable
" Here we only need to set how many line to read.
" ---------------------------------------------------------
set modelines=5
