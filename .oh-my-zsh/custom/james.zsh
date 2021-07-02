if [[ $- == *i* ]]; then
    source ~/.oh-my-zsh/custom/tmuxinator.zsh
    export GITAWAREPROMPT=~/.bash/git-aware-prompt
    source $GITAWAREPROMPT/main.sh
    export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    export NODE_ENV=development

    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
    export PATH=$PATH:$JAVA_HOME/bin:/git_tf
    export PATH="/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core":$PATH
    export PATH="/Users/jamesingold/git-tf":$PATH
    ### Added by the Heroku Toolbelt
    export PATH="/usr/local/heroku/bin:$PATH"
        export ANDROID_HOME=/usr/local/share/android-sdk

    ##
    # Your previous /Users/jamesingold/.bash_profile file was backed up as /Users/jamesingold/.bash_profile.macports-saved_2015-07-06_at_19:48:16
    ##

    # MacPorts Installer addition on 2015-07-06_at_19:48:16: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    #Fast shortcuts
    alias rshell='exec zsh'
    alias debugnode='node-inspector & node --debug ./index.js'
    alias kill5858='kill -9 $(lsof -t -i:5858)'
    alias kali='docker run -t -i kalilinux/kali-linux-docker /bin/bash'
    #python
    alias activate='source ENV/bin/activate'
    #Xcode
    alias xcode='open -a Xcode' # open folder with xcode
    #ssh
    alias pi='ssh pi@192.168.1.141'
    alias nas='ssh admin@192.168.1.148'
    #fix max files error
    ulimit -n 480
    # --files: List files that would be searched but do not search
    # --no-ignore: Do not respect .gitignore, etc...
    # --hidden: Search hidden files and folders
    # --follow: Follow symlinks
    # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,bower_components,App_Resources}/*"'
    #fix mouse issues by unloading and reloading bluetooth driver
    function copy-ssh() {
        iFile=$1
        if [ -z "$1" ]; then
            iFile="id_rsa"
        fi
        echo "$iFile copied"
        pbcopy < ~/.ssh/$iFile.pub
    }
    DEFAULT_CRYPTOS="BTC,ETH,XMR,LSK,VTC,NXS,ANT,LTC"

    function crypto() {
        cryptos=$1
        if [ -z "$1" ]; then
        cryptos=$DEFAULT_CRYPTOS
        fi

        http --json https://min-api.cryptocompare.com/data/pricemulti\?fsyms=$cryptos\&tsyms=USD --body
    }
    function log_crypto() {
        crypto $1 | jq "{cryptos: . , date: now}" | cat
    }
    function fhir_server() {
        sed -i '.bak' 's/https:\/\/fhir-ehr.sandboxcerner.com\/dstu2\/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca\//http:\/\/localhost:3000\/api\//g' $1
    }
    function fhir_data() {
        cat $1 | jq '[.[] | .resource]' > "mongo/$1"
    }

    function parse_token() {
        jq .tokenResponse.access_token | sed 's/\"//g' | pbcopy
    }

    function sts_cache() {
      bmemcached-cli $STS_CACHE
    }

    function fhir_mongo() {
      mongoimport --jsonArray --db juxly-fhir --collection $1 --file $2
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

      function standup() {
        curl -X GET -H "X-TrackerToken: $PIVOTAL_TOKEN" "https://www.pivotaltracker.com/services/v5/projects/1776629/search?query=type:feature,bug,chore+includedone:true+state:accepted,delivered,finished+modified_since:-1w+owner:2098523" | jq '[.stories.stories[]|{id:.id, name:.name, type:.story_type, labels:.labels, accepted:.accepted_at, state:.current_state}]|sort_by(.state)|.[]|"\(.id)-\(.type) \(.name) \(.state) \(.accepted)"'
      }

    function nvm_update() {
      # -r for raw output / no double quotes around version number
      NVM_VERSION_TAG=$(curl -sL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.name')
      curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION_TAG/install.sh" | bash
    }
fi
