# $FreeBSD: releng/10.3/share/skel/dot.cshrc 266029 2014-05-14 15:23:06Z bdrewery $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
# setenv	BLOCKSIZE	K
# A righteous umask
# umask 22

setenv	EDITOR	vim
setenv	PAGER	less

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif

# For Tmux 256 Color
set TERM = screen-256color

# Set Prompt - 256 colors
if ($euser == $user) then 
    set prompt = "\n%{^[[1;38;5;82m%}%m: %{^[[1;38;5;87m%}%~\n%{^[[1;38;5;218m%}%T %{^[[1;38;5;226m%}%n %{^[[31;1m%}%#%{^[[0m%} "
else 
    set prompt = "\n%{^[[1;38;5;82m%}%m: %{^[[1;38;5;87m%}%~\n%{^[[1;38;5;218m%}%T %{^[[1;38;5;226m%}%n -> %{^[[1;38;5;214m%}%N %{^[[31;1m%}%#%{^[[0m%} "
endif

# Set ls Color
setenv LSCOLORS gxfxcxdxcxegedabagacad
alias ls 'ls -FG'
alias ll 'ls -laFG'
