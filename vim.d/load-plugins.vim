" ======================================================== "
"                     Vim-Plug Plugins                     "
" ======================================================== "

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
        Plug 'itchyny/lightline.vim'

        " fugitive.vim: A Git wrapper so awesome, it should be illegal
        Plug 'tpope/vim-fugitive'

        " nerdtree: A tree explorer plugin for vim.
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

        " Show Tagbar with ctags provided.
        Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }

        " YouCompleteMe
        " ---
        " Best plugin for autocompletion

        " Build Command
        function! BuildYCM(info)
            " info is a dictionary with 3 fields
            " - name:   name of the plugin
            " - status: 'installed', 'updated', or 'unchanged'
            " - force:  set on PlugInstall! or PlugUpdate!
            if a:info.status == 'installed' || a:info.force
                !python3 ./install.py --clangd-completer --java-completer --ts-completer
            endif
        endfunction

        Plug 'Valloric/YouCompleteMe', {
            \   'do': function('BuildYCM'),
            \   'for': ['c', 'cpp'],
            \   'on': []
            \ }
        " Create proxy command to load on demand
        command! YcmStart call plug#load('YouCompleteMe') " | call youcompleteme#Enable()


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
