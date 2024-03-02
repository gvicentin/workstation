#
# ~/.bashrc
#
# github.com/gvicentin/workstation
# ------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------
alias ls='ls --color=auto'
alias ll='exa -l'
alias la='exa -la'

alias grep='grep --color=auto'

alias scripts="cd ${HOME}/scripts"
alias github="cd ${HOME}/github"

alias vi="nvim"
alias vim="nvim"

alias src='source ~/.bashrc'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias t="tmux attach || tmux new-session"
alias tas="tmux attach-session -t"
alias tl="tmux list-sessions"
alias ts="tmux new-session -s"
alias tkss="tmux kill-session -t"
alias tksv="tmux kill-server"

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gsb="git status -s"

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------
source "$BASH_CUSTOM_DIR/git-completion.bash"
source "$BASH_CUSTOM_DIR/tmux-completion.bash"
source "$HOME/.asdf/completions/asdf.bash"

__git_complete g _git_main
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gd _git_diff
__git_complete gco _git_checkout

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
source "$HOME/.asdf/asdf.sh"

# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------
setup_prompt() {
    LAST_EC=$?
    GIT_PS1=$(__git_ps1 "(%s)")

    if [ "$LAST_EC" -eq 0 ]; then
        PS1='\n\[\e[34m\]\w\[\e[0m\] ${GIT_PS1}\n\[\e[32m\]❯\[\e[0m\] '
    else
        PS1='\n\[\e[34m\]\w\[\e[0m\] ${GIT_PS1}\n\[\e[91m\]❯\[\e[0m\] '
    fi
}

PROMPT_DIRTRIM=2
PROMPT_COMMAND=(setup_prompt)

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCONFLICTSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
source "$BASH_CUSTOM_DIR/git-prompt.sh"
