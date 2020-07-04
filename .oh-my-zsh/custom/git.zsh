function createNodeGitIgnore() {
  wget https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore && mv Node.gitignore .gitignore
}
