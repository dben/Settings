alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ping='ping -c 4'
alias git-purge='git branch --merged | grep -Ev "(\*|master|develop|prod|production|qa|demo|staging|dev)" | xargs -n 1 git branch -d'
alias aws-login='aws ecr get-login-password | docker login --username AWS --password-stdin 770326815359.dkr.ecr.us-east-1.amazonaws.com'
alias clubpr='club story -f $'"'"'[ch%id] %t\n\n%d\n\n%u'"'"' | hub pull-request -a dben -F -'
alias ksd='kubectl ksd get secrets -o yaml'
alias gitx='git update-index --chmod=+x'
alias ls='ls -AGl'

zmodload zsh/zpty

fpath=( ~/.oh-my-zsh/custom/functions $fpath )
autoload ~/.oh-my-zsh/custom/functions/*(.:t)

eval $(thefuck --alias)

