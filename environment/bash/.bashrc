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
alias ll='eza -l'
alias la='eza -la'

alias grep='grep --color=auto'

alias scripts="cd ${HOME}/scripts"
alias github="cd ${HOME}/github"

alias vi="nvim"
alias vim="nvim"

alias src='source ~/.bashrc'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias ta="tmux attach || tmux new-session"
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
alias glo="git log --oneline --decorate --all --graph"

alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl edit'
alias kgall='kubectl get --all-namespaces'

alias tlab="tsuru target set tsuru-lab"
alias tprod="tsuru target set tsuru-prod"

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------
source "$BASH_CUSTOM_DIR/git-completion.bash"
source "$BASH_CUSTOM_DIR/tmux-completion.bash"
source "$BASH_CUSTOM_DIR/kubectl-completion.bash"
source "$BASH_CUSTOM_DIR/kubectx-completion.bash"
source "$BASH_CUSTOM_DIR/kubens-completion.bash"
source "$HOME/.asdf/completions/asdf.bash"

__git_complete g _git_main
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gd _git_diff
__git_complete gco _git_checkout

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
take() {
    if [ -d "$1" ]; then
        cd "$1"
    else
        mkdir -p "$1"; cd "$1"
    fi
}

kubeprod() {
    export KUBECONFIG_PREV="$KUBECONFIG"
    KUBECONFIG="$HOME/.kube/gke-prod-config"
}

kubereset() {
    export KUBECONFIG="$KUBECONFIG_PREV"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCONFLICTSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
source "$BASH_CUSTOM_DIR/git-prompt.sh"

prompt_right() {
    echo -e "(\033[0;32m${KCTX} :: ${KNS}\033[0m) [\033[0;33m${TSURUTG}\033[0m]"
}

prompt_left() {
    [ "$LEC" -ne 0 ] && ECPROMPT="${LEC} 󰘌 " || ECPROMPT=""
    echo -e "\033[0;31m${ECPROMPT}\033[0m\033[0;34m\w\033[0m ${GITP}\033[0m"
}

prompt() {
    LEC=$?
    GITP=$(__git_ps1 "(%s)")
    KCTX="$(kubectl config current-context 2> /dev/null)"
    KNS=""

    if [ -n "$KCTX" ]; then
        KNS="$(kubectl config get-contexts "$KCTX" --no-headers | awk '{ print $5 }')"
    else
        KCTX="empty"
        KNS="empty"
    fi

    [ -f ~/.tsuru/target ] &&
        TSURUTG="$(grep $(cat ~/.tsuru/target) ~/.tsuru/targets | awk '{ print $1 }')" ||
        TSURUTG=""

    PS1="$(printf "\n%*s\r%s" "$(($(tput cols)+22))" "$(prompt_right)" "$(prompt_left)")\n\[\e[35m\]❯\[\e[0m\] "

    if [ "$(id -u)" -ne 0 ]; then
        echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> \
            "$HOME/.logs/bash-history-$(date "+%Y-%m-%d").log";
    fi
}

PROMPT_DIRTRIM=2
PROMPT_COMMAND=prompt

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
