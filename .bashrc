# .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
# When you login (type username and password) via console, either sitting at the machine, or remotely via ssh 
# .bash_profile is executed to configure your shell before the initial command prompt.
#
# But, if you’ve already logged into your machine and open a new terminal window (xterm) then .bashrc is executed
# before the window command prompt. .bashrc is also run when you start a new bash instance by typing /bin/bash in a
# terminal.
#
# On OS X, Terminal by default runs a login shell every time, so this is a little different to most other systems, 
# but you can configure that in the preferences.

# Functions and autocomplete 
[[ -r "$HOME/.bash_functions.sh" ]] && . "$HOME/.bash_functions.sh"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

cd .

for c in "/usr/local/etc/bash_completion.d/"*; do
  [[ -r "$c" ]] && source "$c"
done

#eval "$(rbenv init -)"
eval "$(hub alias -s)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
eval "$(thefuck --alias)"

alias server='python -m SimpleHTTPServer 8090'
alias ll='ls -la'
alias cd='ccd'
alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ping='ping -c 4'
alias chrome="open -a \"Google Chrome\""
alias fig='docker-compose'
complete -F _docker_compose 'fig'
alias git-purge='git branch --merged | grep -Ev "(\*|master|develop|prod|production|qa|demo|staging|dev)" | xargs -n 1 git branch -d'
alias kuna='kubens'
complete -F _kube_namespaces 'kuna'
alias ku='kubectl'
complete -F __start_kubectl 'ku'
alias ku+='kubectl apply'
complete -F __start_kubectl 'ku+'
alias ku-='kubectl delete'
complete -F __start_kubectl 'ku-'
complete -F __kubectl_get_resource_pod 'kulo'
alias __git='hub'
