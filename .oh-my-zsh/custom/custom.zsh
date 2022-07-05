alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ping='ping -c 4'
alias git-purge='git branch --merged | grep -Ev "(\*|master|develop|prod|production|qa|demo|staging|dev)" | xargs -n 1 git branch -d'
alias aws-login='aws ecr get-login-password | docker login --username AWS --password-stdin 770326815359.dkr.ecr.us-east-1.amazonaws.com'
alias clubpr='short story -f $'"'"'[ch%id] %t\n\n%d\n\n%u'"'"' | hub pull-request -a dben -F -'
alias club='short'
alias ksd='kubectl ksd get secrets -o yaml'
alias gitx='git update-index --chmod=+x'
alias ls='ls -AGl'
function docker-truncate() {
    limactl shell 0 sudo truncate -s 0 $(docker inspect --format="{{.LogPath}}" $1)
}
function docker-kill() {
    ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
}
function clone-all(){
    hub api orgs/$1/repos --paginate | grep -o 'git@[^"]*' | xargs -L1 git clone
}
function docker-clear-logs(){
    docker run --rm -v /var/lib/docker:/var/lib/docker alpine sh -c "echo '' > $(docker inspect --format='{{.LogPath}}' $1)"
}
function watch(){
    dir="${1:-'*.*'}"
    cmd="${2:-'echo'}"

    while [[ true ]]
    do
            files=$(find . -name "$dir" -type f -mtime -20s)
        if [[ $files == "" ]] ; then
        else
            printf "Files changed - %s\n" $(date "+%X") 
            echo $files
            eval $cmd
        fi
        sleep 20 
    done

}

zmodload zsh/zpty

fpath=( ~/.oh-my-zsh/custom/functions $fpath )
autoload ~/.oh-my-zsh/custom/functions/*(.:t)

eval $(thefuck --alias)
