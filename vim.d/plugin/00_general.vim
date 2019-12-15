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
" Show single or double width for ambiguous characters.
" 將不明字寬的字元顯示為單字寬或雙字寬。
" ---------------------------------------------------------
" Notes:
" 不明字寬是指如歐元、註冊商標、智財權標誌等字元
" 由於在東西方語言中皆會使用，因此字寬不明。
"
" 顯示為單字寬應能滿足大部分情況，但有時候對於整段都是 CJK
" (中日韓) 等雙字寬文字時，你可能會希望將這些符號也顯示成
" 雙字寬。
" ---------------------------------------------------------
" set ambiwidth=double


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
" Specify the behavior when switching between buffers
" ---------------------------------------------------------
try
    set switchbuf=useopen,usetab,newtab
catch
    " Do nothing
endtry
