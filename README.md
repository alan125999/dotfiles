# dotfiles
My dotfiles :D

### Install
``` bash
cd ~
git clone https://github.com/alan125999/dotfiles.git
```

### Usage
Just source them or create some symbolic links !

### Example
- vim
``` vim
source $HOME/dotfiles/vimrc
```
- tmux
``` tmux
source-file ~/dotfiles/.tmux.conf
```
- Symbolic link
``` bash
ln -s ~/dotfiles/vimrc ~/.vimrc
