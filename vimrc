""""""""""""""""""""""
"   Alan's setting   "
""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Disable Vi Compatible
" 關閉 Vi 相容模式
set nocompatible

" For CJK characters (probably not needed)
" 雙字元
set ambiwidth=double

" Detect File Type, and then auto load relative plugin and set intendation rule
" 偵測檔案類別： filetype on
" 依據偵測的類別，啟用相關的 plugins： filetype plugin
" 依據偵測的類別，使用不同縮排的規則： filetype indent
filetype plugin indent on

" Set to auto read when a file is changed from the outside
"set autoread

" Restore cursor to the last edit position while open files. (Require viminfo)
" 讓下次開啟此檔案時，可以回到上次游標的位置 (Require viminfo)
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

" Tell vim to remember certain things when we exit (Defalut is on)
" Required by RestoreCursor
"viminfo='100,<50,s10,h

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Turn backup off, since most stuff is in SVN, git etc. anyway...
"set nobackup
"set nowb
"set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enalbe Mouse Control
" 啟用滑鼠操作
set mouse=a

" Virtual Mode, 使游標可以移到實際上沒有字元的位置
set virtualedit=all

" Turn on the Wild menu
set wildmenu

" Show Row Number
" 顯示行號
set number

" Show Relative Row Number
" 顯示相對行號
set relativenumber

" Add a bit extra margin to the left
set foldcolumn=1

" Show Position
" 顯示游標座標
set ruler

" Minimal number of screen lines to keep above and below the cursor.
" 在捲動頁面時，保留幾行的高度
set scrolloff=7

" Show Current Command
" 顯示當前按下的指令
set showcmd

" Show Current Mode ,eg. INSERT, INSERT(paste)
" 顯示當前模式
set showmode

" Set CommandLine position
" 設定命令列位置
set cmdheight=1

" Do not wrap while a row is too long
" 當一行內容太長時，不要折行
"set nowrap

" Let wrap won't cut in the middle of a word
" 讓自動折行不會破壞單字（不折行在單字中間）
set linebreak

" Let scroll to left or right more smooth
" 當沒有折行，而要左右捲動頁面時，一次捲動幾行（數字越小越平滑）
set sidescroll=1

" Auto fold method
" 自動折疊
set foldmethod=syntax

" Set number of spaces that a <Tab> in the file counts for
" 設定 Tab字元 要顯示成多少空格的寬度
set tabstop=4

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Always show tab line
set showtabline=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable xterm 256 colors
" 啟用 256 色
set t_Co=256

" Enable Syntax Color
" 啟用語法上色
syntax enable

" Color Scheme
" 設定色彩配置主題
try
  colorscheme industry
catch /^Vim\%((\a\+)\)\=:E185/
  try
    colorscheme koehler
  catch /^Vim\%((\a\+)\)\=:E185/
    try
      colorscheme torte
    catch /^Vim\%((\a\+)\)\=:E185/
      try
        colorscheme murphy
      catch /^Vim\%((\a\+)\)\=:E185/
      endtry
    endtry
  endtry
endtry

" Highlight Current Row
" 高亮當前橫行
set cursorline
highlight CursorLine term=bold cterm=bold ctermbg=236 guibg=Grey40

" Highlight Current Column
" 高亮當前直行
set cursorcolumn
highlight CursorColumn term=bold cterm=bold ctermbg=236 guibg=Grey40

" Highlight Tab line
highlight TabLineFill ctermfg=236 ctermbg=236

" Highlight tab
highlight TabLine ctermfg=white ctermbg=238

" Highlight seleted tab
highlight TabLineSel ctermfg=white ctermbg=33 term=bold cterm=bold

" Highlight fold column
highlight FoldColumn ctermfg=33 ctermbg=236

" Highlight Warning Message
highlight WarningMsg term=standout ctermfg=202

" Remove background color for normal text
" 去除背景
highlight Normal ctermbg=NONE

" Show Hidden Characters
" 顯示隱藏字元
set list

" Set Replace Format for Hidden Characters
" 設定要顯示的隱藏字元，及用於顯示的替換字元
set listchars=tab:>-,trail:.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Detect file encoding
" 由前向後自動偵測編碼，當解讀時沒有錯誤即選用該編碼
" 因此越是特殊，容易區別的編碼要放越前面
set fileencodings=ucs-bom,utf-8,Big5,cp936

" Set Default file encoding for new file
" 開新檔案時所使用的預設編碼
set encoding=utf-8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It "feels" like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
" used.
" 設定編輯時，按下一次Tab鍵會產生的縮排寬度，實際上會以最多的Tab和空格填滿
" E.g. 當 tabstop = 4, softtabstop = 9, 則會插入 2 個 Tab 和一個空格
set softtabstop=4

" Enable Auto Indentation (There are 3 different modes)
" 設定自動縮排
set autoindent
set smartindent
"set cindent

" Set number of spaces that auto indentation will insert
" 設定自動縮排時的寬度
set shiftwidth=4

" Auto indentation will be expand to spaces
" 自動縮排使用空格而不是Tab
set expandtab

" Be smart when using tabs ;)
set smarttab

" Make backspace work like most other programs
" If hit backspace insert strange characters like ^?
" Use the command " stty erase '^?' "
" or add that in bashrc
" 設定 backspace 鍵
" e.g. 可以在退格到行首時，從上一行的行末繼續
" 如果按退格鍵會出現奇怪的字元，像是^?
" 使用指令 stty erase '^?' 可以修復
" 若不想每次輸入可以加到 shell 的設定檔中
set backspace=2
" Another solution (?)
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Delete trailing white space on save, useful for some filetypes ;)
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

augroup cleanExtraSpaces
  autocmd!
  autocmd BufWritePre *.js,*.py,*.sh,*.c :call CleanExtraSpaces()
augroup END

""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A buffer becomes hidden when it is abandoned
set hidden

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry


""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""
" Show Status Bar
" 顯示狀態列（似乎只能設定為 2）
set laststatus=2

" Style Status Bar
" 自訂狀態列
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

if has('statusline')
  set statusline=%2n\                              " buffer number
  set statusline+=%<                               " Truncate here if winwidth is too small (filename too long)
  set statusline+=%f\                              " file name
  set statusline+=%m                               " modified flag
  set statusline+=%r                               " read only flag
  set statusline+=[%{strlen(&fenc)?&fenc:'none'},\ " file encoding
  set statusline+=%{&ff}]                          " file format
  set statusline+=%y                               " filetype
  set statusline+=%=                               " left/right separator
  set statusline+=\ %{SyntaxItem()}\               " syntax highlight group under cursor
  set statusline+=0x%B\                            " character code under cursor
  set statusline+=%l/%L,\ %c%V\ %P                 " cursor position/offset
endif

highlight StatusLine cterm=bold,reverse ctermfg=33 ctermbg=255


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Searching Result
"" 搜尋結果設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜尋忽略大小寫
set ignorecase

" When searching try to be smart about cases
set smartcase

" 高亮搜尋的字串
set hlsearch

" 輸入搜尋字串時，隨著輸入的字串，預先開始搜尋
set incsearch

" For regular expressions turn magic on
set magic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! EchoWarning(msg)
  echohl WarningMsg
  echo a:msg
  echohl None
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try

    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')

    " Example

        " Make sure you use single quotes

        " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
        "Plug 'junegunn/vim-easy-align'

        " Any valid git URL is allowed
        "Plug 'https://github.com/junegunn/vim-github-dashboard.git'

        " Multiple Plug commands can be written in a single line using | separators
        "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

        " On-demand loading
        "Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        "Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

        " Using a non-master branch
        "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

        " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
        "Plug 'fatih/vim-go', { 'tag': '*' }

        " Plugin options
        "Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

        " Plugin outside ~/.vim/plugged with post-update hook
        "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

        " Unmanaged plugin (manually installed and updated)
        "Plug '~/my-prototype-plugin'


    " Plugins

        " lightline: A light and configurable statusline/tabline plugin for Vim
        "Plug 'itchyny/lightline.vim'

        " fugitive.vim: A Git wrapper so awesome, it should be illegal
        "Plug 'tpope/vim-fugitive'

        " nerdtree: A tree explorer plugin for vim.
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

        " Run interactive commands inside a Vim buffer 
        Plug 'oplatek/Conque-Shell'

    " Initialize plugin system
    call plug#end()

catch
    echo 'Warning: Vim-Plug is not installed!'
    echo 'Try to install (y/n)?'
    echo '[No] '
    silent exec "! sh -c '
      \ while true; do
      \     read yn;
      \     case $yn in
      \         [Yy]* )
      \             curl -fLo ~/.vim/autoload/plug.vim 
      \                  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
      \             exit;;
      \         * )
      \             echo \"...skipped\";
      \             exit;;
      \     esac
      \ done
      \'"
"    ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
"set noshowmode
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

" NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"

