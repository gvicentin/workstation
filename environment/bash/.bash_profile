#
# ~/.bash_profile
#
# github.com/gvicentin/environment
# ------------------------------------------------------------------------------

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -d "$HOME/scripts" ] && PATH="$PATH:$HOME/scripts"
[ -d "$HOME/go/bin" ] && PATH="$PATH:$HOME/go/bin"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
    setup-monitor
fi
