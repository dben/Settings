# .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
# When you login (type username and password) via console, either sitting at the machine, or remotely via ssh 
# .bash_profile is executed to configure your shell before the initial command prompt.
#
# But, if you've already logged into your machine and open a new terminal window (xterm) then .bashrc is executed
# before the window command prompt. .bashrc is also run when you start a new bash instance by typing /bin/bash in a
# terminal.
#
# On OS X, Terminal by default runs a login shell every time, so this is a little different to most other systems, 
# but you can configure that in the preferences.
# 
# .bash_profile can never be sourced again in child process. Every level of nested Bash sources .bashrc, so if you put 
# something like export A=a:$A in .bashrc, your $A will get longer in nested Bash. Leave environment variable in 
# .bash_profile, and aliases in .bashrc

append_path () { [[ :$PATH: == *":$1:"* ]] || export PATH="$1:$PATH";  }

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export N_PREFIX="$HOME/n"

append_path "$N_PREFIX/bin"
append_path "~/.composer/vendor/bin"
append_path "/usr/local/sbin"
append_path "/Users/davidbenson/.pyenv/bin"
append_path "/usr/local/opt/php@7.1/bin"
append_path "/usr/local/opt/php@7.1/sbin"

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# Because of this, I am moving everything except for environment variables to .bashrc
