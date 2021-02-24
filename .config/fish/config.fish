alias config='/usr/bin/git --git-dir=$HOME/dotfilesrepo/ --work-tree=$HOME'
export MANPAGER="vim -c 'set ft=man' -"

if status --is-login 
  exec startx &> /dev/null
end
