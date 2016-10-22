if [[ $- == *i* ]]; then
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export NODE_ENV=development

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin:/git_tf
export PATH="/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core/":$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# MacPorts Installer addition on 2015-07-06_at_19:48:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

#Fast shortcuts
alias c='clear'
alias r='reset'
alias q='exit'
alias _='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias editgitconfig='sudo nano ~/.gitconfig'
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias bashprofile='sudo nano ~/.bash_profile'
alias reloadprofile='source ~/.bash_profile'
alias today='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias debugnode='node-inspector & node --debug ./index.js'
alias kill5858='kill -9 $(lsof -t -i:5858)'
alias copy-ssh='pbcopy < ~/.ssh/id_rsa.pub'
#python
alias activate='source ENV/bin/activate'

#ssh
alias pi='ssh pi@192.168.1.141'

#fix max files error
ulimit -n 480

# fix mouse issues by unloading and reloading bluetooth driver
function fixmouse() {
	echo "Terminating Bluetooth driver I/O Kit driver instance"
	sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
	echo "Waiting 3 seconds to reload driver"
	sleep 3
	sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
	echo "Done!"
}
#Creates a new release branch (default based off master)  named with the date and time created
# Usage: git_create_release  # new off master
#          git_create_release develop # new off dev branch
git_create_release(){
    baseBranch=$1
    if [ -z "$1" ]; then
        baseBranch="master"
    fi
    name="release/$(date +'%m.%d.%Y@%H.%M')"
    echo "New Release branch named: [$name] based off [$baseBranch] branch"

    if git diff-index --quiet HEAD --; then
        
        git checkout $baseBranch &&{
            git pull
            git checkout -b $name && git push -u origin $name
        }
    else
        echo 'Commit or stash changes first'
    fi
}
fi
