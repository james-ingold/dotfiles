function k8dashboard () {
  kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') 
        echo "Copy the Token portion above."
        /usr/bin/open -a "/Applications/Google Chrome.app" 'http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login'
        kubectl proxy
}

function podname {
    jxk get pods | grep $1 | awk '{print $1}';
}

function getPod () {
  # if JXK_NAMESPACE not set
  if [[ -z "${JXK_NAMESPACE}" ]]; then
    set-namespace $1
  fi
  if [ "$#" -eq 1 ] 
  then
    POD=$1
  else
    POD=$2
  fi
  jxk -n $JXK_NAMESPACE get pods | grep $POD | awk '{print $1}' | head -n 1
}

function prod-hhunter () {
  jxk -n hhunter port-forward $(getPod hhunter hhunter) 9200:9200
}

function backup-hhunter () {
  DATE=`date +%Y%m%d`
  curl -XPUT 'http://localhost:9200/_snapshot/backups/'"$DATE"'?wait_for_completion=true&pretty=true'
}

function set-namespace () {
  export JXK_NAMESPACE=$1
}

function bash-pod () {
  # if JXK_NAMESPACE not set
  if [[ -z "${JXK_NAMESPACE}" ]]; then
    set-namespace $1
  fi
  if [ "$#" -eq 1 ] 
  then
    POD=$1
  else
    POD=$2
  fi
  jxk -n $JXK_NAMESPACE exec -it $(getPod $POD) -- /bin/bash
}
