# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILE="$HOME/.bash_history"
HISTFILESIZE=1000
HISTSIZE=1000

lfcd () {
  cd "$(command lf -print-last-dir "$@")"
}

alias ls="lsd"
alias lf="lfcd"

eval "$(starship init bash)"
