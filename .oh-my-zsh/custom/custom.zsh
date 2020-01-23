alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ping='ping -c 4'
alias git-purge='git branch --merged | grep -Ev "(\*|master|develop|prod|production|qa|demo|staging|dev)" | xargs -n 1 git branch -d'

zmodload zsh/zpty

fpath=( ~/.oh-my-zsh/custom/functions $fpath )
autoload ~/.oh-my-zsh/custom/functions/*(.:t)

eval $(thefuck --alias)

