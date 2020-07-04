function remove-images () {
  for p in $(docker image ls | grep -v mysql | grep -v node | awk '{FS= " "} {print $3}'); do
    echo $p
    docker image rm $p -f
  done
}

function shellContainer () {
  docker run -it "$1" /bin/sh
}
