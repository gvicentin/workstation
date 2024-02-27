# Additional contexts should be in ~/.kube/config-files/ 
CUSTOM_KUBE_CONTEXTS="$HOME/.kube/config-files/"
export KUBECONFIG=""

OIFS="$IFS"
IFS=$'\n'
for contextFile in `find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yaml"` 
do
    # echo "$contextFile"
    export KUBECONFIG="$contextFile:$KUBECONFIG"
done
IFS="$OIFS"

export KUBECONFIG="$KUBECONFIG:$HOME/.kube/config"
