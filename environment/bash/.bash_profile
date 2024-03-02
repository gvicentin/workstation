#
# ~/.bash_profile
#
# github.com/gvicentin/workstation
# ------------------------------------------------------------------------------

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -d "$HOME/scripts" ] && PATH="$PATH:$HOME/scripts"
[ -d "$HOME/go/bin" ] && PATH="$PATH:$HOME/go/bin"

export EDITOR="nvim"
export LMONITOR="HDMI-0"
export RMONITOR="DP-0"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
    setup-monitor
fi
