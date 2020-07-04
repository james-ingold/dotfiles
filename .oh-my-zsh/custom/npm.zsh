function customNpmOutdated() {
  npm outdated | sed '1d' | awk '{ if ($2 != $3) { print } }'
}
