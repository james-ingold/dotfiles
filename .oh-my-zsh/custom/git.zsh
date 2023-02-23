function createNodeGitIgnore() {
  wget https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore && mv Node.gitignore .gitignore
}

function cloneAllRepos() {
  curl -s https://api.github.com/users/$1/repos | jq -r ".[].ssh_url" | xargs -L1 git clone
}

function downloadEntireGithub() {
  if [ -z "$1" ]; then
      echo "waiting for the following arguments: username + max-page-number"
      exit 1
  else
      name=$1
  fi

  if [ -z "$2" ]; then
      max=2
  else
      max=$2
  fi

  cntx="users"
  page=1

  echo $name
  echo $max
  echo $cntx
  echo $page

  until (( $page -lt $max ))
  do
      curl "https://api.github.com/$cntx/$name/repos?page=$page&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
      $page=$page+1
  done

  exit 0
}
