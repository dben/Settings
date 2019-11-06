ccd()
{
  history -w # write current history file
  builtin cd "$@"  # do actual cd
  local HISTDIR="$HOME/.bash_history.d$PWD" # use nested folders for history
  if [ ! -d "$HISTDIR" ]; then # create folder if needed
    mkdir -p "$HISTDIR"
    cp $HISTFILE "$HISTDIR/bash_history.txt"
  fi
  export HISTFILE="$HISTDIR/bash_history.txt" # set new history file
  history -c  # clear memory
  history -r #read from current histfile
}

back()
{
  if [ ! -z "$OLDPWD" ]; then
    ccd "$OLDPWD"
  fi
}

kulo() { kubectl logs $(kubectl get pods --no-headers -o custom-columns=NAME:.metadata.name | grep $1 ) $2; }
