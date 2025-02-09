# ~/.bashrc
#
# github.com/gvicentin/workstation/environment/bash/.bashrc
# ------------------------------------------------------------------------------

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"

# Rust environment
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# asdf
. "$HOME/.asdf/asdf.sh"

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

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------
. "$HOME/.bash/git-completion.bash"
. "$HOME/.bash/tmux-completion.bash"
. "$HOME/.bash/kubectl-completion.bash"
. "$HOME/.bash/kubectx-completion.bash"
. "$HOME/.bash/kubens-completion.bash"
. "$HOME/.asdf/completions/asdf.bash"

__git_complete g _git_main
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gd _git_diff
__git_complete gco _git_checkout

# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCONFLICTSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
. "$HOME/.bash/git-prompt.sh"

rprompt() {
	echo -e "(\033[0;32m${KCTX:-"empty"} :: ${KNS:-"empty"}\033[0m) "
}

lprompt() {
	[ "$LEC" -ne 0 ] && ECPROMPT="exit(${LEC}) 󰘌 " || ECPROMPT=""
	echo -e "\033[0;31m${ECPROMPT}\033[0m\033[0;34m\w\033[0m ${GITP}\033[0m"
}

prompt() {
    LEC=$?
    GITP=$(__git_ps1 "(%s)")
    KCTX="$(kubectl config current-context 2> /dev/null)"
    KNS=""

    if [ -n "$KCTX" ]; then
        KNS="$(kubectl config get-contexts "$KCTX" --no-headers | awk '{ print $5 }')"
    fi

    PS1="$(printf "\n%*s\r%s" "$(($(tput cols)+11))" "$(rprompt)" "$(lprompt)")\n\[\e[35m\]❯\[\e[0m\] "
}

PROMPT_DIRTRIM=2
PROMPT_COMMAND=prompt
