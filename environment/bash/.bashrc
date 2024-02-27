#
# ~/.bashrc
#
# github.com/gvicentin/environment
# ------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------
setup_prompt() {
  if [ "$?" -eq 0 ]; then
    PS1='\n\[\e[34m\]\w\[\e[0m\] \n\[\e[32m\]❯\[\e[0m\] '
  else
    PS1='\n\[\e[34m\]\w\[\e[0m\] \n\[\e[91m\]❯\[\e[0m\] '
  fi
}

PROMPT_DIRTRIM=2
PROMPT_COMMAND=(setup_prompt)

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------
alias ls='ls --color=auto'
alias ll='exa -l'
alias la='exa -la'

alias grep='grep --color=auto'

alias suc="cd ${HOME}/suckless"
alias vgr="cd ${HOME}/github/gvicentin"

alias vi="nvim"
alias vim="nvim"

alias ta="tmux attach"
alias tl="tmux list-sessions"
alias ts="tmux new-session -s"
alias tkss="tmux kill-session -t"
alias tksv="tmux kill-server"

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------
source "$HOME/.asdf/completions/asdf.bash"

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
source "$HOME/.asdf/asdf.sh"
