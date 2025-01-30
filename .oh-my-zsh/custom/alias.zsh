export VISUAL=nvim
alias e='$EDITOR'
# alias python=/usr/local/bin/python3
#alias pip=/usr/local/bin/pip3
alias vimdiff='vimdiff -c"windo set wrap" $*' # auto word wrap for vimdiff
alias vim="stty stop '' -ixoff; nvim" # ctrl + s is already used for terminals but we want to use it for the nerdtree in vim
alias vi="stty stop '' -ixoff; nvim"
alias vimnotes='e -c Geeknote'
alias cat='bat --theme TwoDark'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias ctags="brew --prefix /bin/ctags"
alias c='clear'
alias r='reset'
alias q='exit'
alias g='git'
alias _='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias reloadzsh='source ~/.zshrc'
alias deleteMerged='git branch --merged | egrep -v "(^\*|master|test|develop)" | xargs git branch -d'
alias tx='tmuxinator'
alias d='docker'
alias ni='npm install'
alias jxk='kubectl --context=juxly-production'
alias nginxConf='jxk -n ingress-nginx exec nginx-ingress-controller-65b9795548-79ksd -- cat /etc/nginx/nginx.conf > ./nginx.conf'
alias ala='open /Applications/Alacritty.app'
alias diffAll='git difftool -y -g'

alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"

alias bashprofile='$EDITOR ~/.bash_profile'
alias reloadprofile='source ~/.bash_profile'
alias today='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias killnode='killall node'
alias editvim='e ~/.vim/vimrc'
alias editssh='e ~/.ssh/config'

#docker
alias dockerrmi='docker rmi $(docker images -qf dangling=true)'
alias dockerstart='open -a Docker'
alias showcontainers='docker ps --filter "status=exited"'

#kube
alias kctx=kubectx
alias kns=kubens
alias kon=kubeon
alias koff=kubeoff
alias k=kubectl
alias krsd=k rollout status deploy
alias jxk='kubectl --context=juxly-production'

#node
alias nrd='npm run debug'

#homebrew
alias updatehb='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
