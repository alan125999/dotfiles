" ======================================================== "
"                     Vim-Plug Plugins                     "
" ======================================================== "
if 0

let s:auto_install = 1

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

        " Show Tagbar with ctags provided.
        Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }

        " Best plugin for autocompletion
        Plug 'Valloric/YouCompleteMe'

        " A Vim plugin to colorize all text in the form #rrggbb or #rgb.
        Plug 'lilydjwg/colorizer'

        " Dark color scheme for Vim and vim-airline, inspired by Dark+ in Visual Studio Code
        Plug 'tomasiser/vim-code-dark'

        " -------------------------------------------------
        " JavaScript & TypeScript
        " -------------------------------------------------

        " vim-javascript
        " ---
        " Vastly improved Javascript indentation and syntax support in Vim.
        Plug 'pangloss/vim-javascript'

        " vim-js
        " ---
        " * Although recomended by author of vim-jsx-pretty in recent version
        " of readme, vim-javascript is still better at least in my opinion.*
        " A Vim syntax highlighting plugin for JavaScript and Flow.js
        " - Better support for the modern JavaScript features
        " - More accurate syntax groups, easy for colorscheme customization
        "Plug 'yuezk/vim-js'

        " vim-jsx-pretty
        " ---
        " The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
        Plug 'HerringtonDarkholme/yats.vim'
        Plug 'maxmellon/vim-jsx-pretty'

    " Initialize plugin system
    call plug#end()

catch

    if s:auto_install
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
        "! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

endtry


" ======================================================== "
"                     Plugins Settings                     "
" ======================================================== "

" ----------------------------------------------------------
" Lightline
" ----------------------------------------------------------
"set noshowmode
"let g:lightline = {
"    \   'colorscheme': 'wombat',
"    \   'active': {
"    \     'left': [ [ 'mode', 'paste' ],
"    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"    \     'right': [ [ 'lineinfo' ],
"    \                [ 'percent' ],
"    \                [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
"    \   },
"    \   'component': {
"    \     'charvaluehex': '0x%B',
"    \   },
"    \   'component_function': {
"    \     'gitbranch': 'fugitive#head'
"    \   },
"    \ }

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

endif
