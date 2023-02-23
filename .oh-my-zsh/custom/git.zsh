function createNodeGitIgnore() {
  wget https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore && mv Node.gitignore .gitignore
}

function cloneAllRepos() {
  curl -s https://api.github.com/users/$1/repos | jq -r ".[].ssh_url" | xargs -L1 git clone
}
