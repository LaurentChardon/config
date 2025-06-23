# Sourced during interactive sessions

autoload -Uz compinit
compinit
autoload -U zfinit
zfinit

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

export PATH=$HOME/bin:$PATH
export TERM=xterm-256color
export TZ=EST5EDT

# Use nvim editor if it exists, or vim, or vi, in order of preference
which vi   &>/dev/null && export EDITOR=vi
which vim  &>/dev/null && export EDITOR=vim  && alias vi=vim
which nvim &>/dev/null && export EDITOR=nvim && alias vi=nvim

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
# Set terminal title (or tab) to hostname
print -Pn "\e]0;%m\a" 
# Set tmux window title to current folder
function precmd() {
    if [ -n "$TMUX" ]; then
        if [ "$PWD" = "$HOME" ]; then
            tmux rename-window "home"
        else
            tmux rename-window "$(basename "$PWD")"
        fi
    fi
}

# Disable mouse reporting (1000h, 1002h, and 1003h) when starting zsh
echo -ne '\e[?1000l'  # Basic mouse mode
echo -ne '\e[?1002l'  # Mouse drag events
echo -ne '\e[?1003l'  # Mouse any events

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# Bind up and down arrow to do partial search using info already typed
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down


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

# Load powerlevel10k
source-file $ZDOTDIR/.p10k.zsh
source-file $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme

# Load OS specific config
PLATFORM=$(uname -s)
source-file $ZDOTDIR/.zshrc.$PLATFORM

# Load tweaked ls colors
source-file $ZDOTDIR/ls_colors

# Load machine specific config
source-file $ZDOTDIR/.zshrc.$HOST

# Display neofetch if it exists
NEO=$(whence neofetch)
[ -n $NEO ] && $NEO

# Prune PATH of redundent entries
source-file $HOME/bin/prune_path
