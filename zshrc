ZSHRC=$HOME/.zshrc

# TODO fix
export PATH=/Users/cnk/src/macvim/src/Macvim:$PATH
export VIM_APP_DIR=$HOME/src/macvim/src/MacVim/build/Release

# Use GNU coreutils everywhere
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# THE LAST SHALL BE FIRST AND THE FIRST SHALL BE LAST
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/src/bin:$PATH

export ALIASES=$HOME/.aliases
export AUTO_ALIASES=$ALIASES/auto

PYTHONRC=$HOME/.pythonrc

export EDITOR=vim

autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.history
HISTSIZE=10000
SAVEHIST=1000000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# source ~/.aliases/**/*
for file in $(find $ALIASES -follow); do source $file; done

# edit this file, and source it
alias vizsh="vim $ZSHRC && source $ZSHRC"

# add an alias
aaa () {
	echo "alias $1=\"$2\"" >> $AUTO_ALIASES
	source $AUTO_ALIASES 
	which $1
}


######### setopts ##############################################################

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

setopt ALWAYS_TO_END
setopt AUTO_NAME_DIRS
setopt AUTO_PUSHD
setopt NO_BEEP

setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST # gets slow with a big history
setopt HIST_VERIFY

# clear rprompt on new commands, thank god for this
setopt transientrprompt


######### bindkeys #############################################################

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# :nmap <Space> i
bindkey -M vicmd ' ' vi-insert

export LESS="-iFRX"

bindkey "^R" history-incremental-search-backward
bindkey "^T" push-line-or-edit

# `man zshcompsys`
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt '%e%e%e'
zstyle ':completion:*' substitute 1
#zstyle :compinstall filename '$HOME/compinstalled'
# End of lines added by compinstall

source $PYTHONRC

# vim:ft=zsh:noet:sw=2 ts=2
