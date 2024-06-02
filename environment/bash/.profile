#
# ~/.bash_profile
#
# github.com/gvicentin/workstation
# ------------------------------------------------------------------------------

export HISTSIZE=100000
export HISTFILESIZE=100000
export EDITOR="nvim"
export BASH_CUSTOM_DIR="$HOME/.bash"

# Kubernetes config files
# TODO:// Add a function to list all available kubeconfig files
export KUBECONFIG="$HOME/.kube/config"
KUBECONFIG="$KUBECONFIG:$HOME/.kube/oci-lab-config"
KUBECONFIG="$KUBECONFIG:$HOME/.kube/oci-dev-config"
KUBECONFIG="$KUBECONFIG:$HOME/.kube/home-cloud-config"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -d "$HOME/scripts" ] && PATH="$PATH:$HOME/scripts"
[ -d "$HOME/go/bin" ] && PATH="$PATH:$HOME/go/bin"
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"

source "$HOME/.asdf/asdf.sh"
