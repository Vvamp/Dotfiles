alias config='/usr/bin/git --git-dir=$HOME/dotfilesrepo/ --work-tree=$HOME'
export MANPAGER="vim -c 'set ft=man' -"

if status --is-login 
  exec startx &> /dev/null
end


# Fix Rendering Bug
set --unexport COLUMNS
set --unexport LINES

# Vars
export TERM=xterm-256color
export EDITOR=vim
