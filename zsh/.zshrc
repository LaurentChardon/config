# Sourced during interactive sessions

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

export EDITOR=nvim
export PATH=$HOME/bin:$PATH

# Force screen to use a login shell
alias screen="screen -l"

alias ls='ls --color=auto'
alias icat='kitten icat'

#  Set prompt
autoload -U colors && colors
if [ -n "$TMUX" ]
then 
  LEVEL=$((SHLVL-1))
  THRESHOLD=3
else
  LEVEL=$((SHLVL))
  THRESHOLD=2
fi
NEWLINE=$'\n'
PS1="%$THRESHOLD(L.%{$fg[red]%}[$LEVEL] .)%{$fg[green]%}[%*] %{$fg[cyan]%}[%n@%m:%~]%{$reset_color%}$NEWLINE$ "

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete # _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
which dircolors &> /dev/null && eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

function source-file()
{
  [ -f $1 ] && source $1
}

# Load OS specific config
PLATFORM=$(uname -s)
source-file $ZDOTDIR/.zshrc.$PLATFORM

# Load tweaked ls colors
source-file $ZDOTDIR/ls_colors

# Load machine specific config
source-file $ZDOTDIR/.zshrc.$HOST

