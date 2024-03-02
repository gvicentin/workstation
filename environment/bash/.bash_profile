#
# ~/.bash_profile
#
# github.com/gvicentin/workstation
# ------------------------------------------------------------------------------

export EDITOR="nvim"
export MONITORL="HDMI-0"
export MONITORR="DP-0"
export BASH_CUSTOM_DIR="$HOME/.bash"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -d "$HOME/scripts" ] && PATH="$PATH:$HOME/scripts"
[ -d "$HOME/go/bin" ] && PATH="$PATH:$HOME/go/bin"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
