#============================================================
#
#  COMMANDS
#
#============================================================
alias bs='brew services'
alias sudo='sudo '
alias sudoe='sudo vim'
alias gw='./gradlew --parallel --daemon '
alias gg='[ ! -z `git rev-parse --show-cdup` ] && `git rev-parse --show-cdup || pwd`/gradlew --parallel --daemon'
alias lx='ls -lXB'                          #  Sort by extension.
alias lk='ls -lSr'                          #  Sort by size, biggest last.
compdef _gradle gradle-or-gradlew

if command -v eza >& /dev/null; then
  alias la='eza --binary -al --group-directories-first'
  alias latr='eza -al --binary --sort=time --reverse'
  alias tree='la --tree'
  compdef _eza la
  function f() {
    local found
    ! found=$(fd -HI "$@") || return 1
    echo "$found" | eza -al
  }
else
  if ls -lv --group-directories-first >& /dev/null ; then
    alias ll="ls -lv --group-directories-first" # directories first, with alphanumeric sorting:
    alias lm='ll | most'                        #  Pipe through 'more'
  else
    alias ll="ls -lv"
    alias lm='ll | most'
  fi
  alias la='ll -A'    #  Show hidden files
  alias lt='ls -ltr'  #  Sort by date, most recent last.
  alias lc='ls -ltcr' #  Sort by/show change time,most recent last.
  alias lu='ls -ltur' #  Sort by/show access time,most recent last.
  if command -v fd >& /dev/null; then
  function f() {
      fd -HI --glob "$1"
  }
  else
  function f() {
      find . -name "$1"
  }
  fi
  alias tree='tree -aCuhs -I .git'
# all files with colors, user info, and human-readable sizes, excluding .git.
fi

alias o=open
alias mkdir='mkdir -p'
alias h='history | grep '
alias which='type -a'
function jqc() {
  jq -C . "$@" | less -Fr
}
alias pp='python -mjson.tool '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vless='vim -u /usr/share/vim/vim82/macros/less.sh'
function mv-() {
  mv "$2" "$1"
}
function r() {
  grep "$1" "${@:2}" -R .
}
# always use full process name, not the first 15 characters
alias pgrep='pgrep -f'
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias cp='cp -iv'
alias du='du -kh' # Makes a more readable output.
alias df='df -h'
alias car=cat
alias d=docker
alias dw='export DOCKER_HOST=unix:///var/run/docker.sock'
alias wls=git-wls
alias app='imo-app'
alias deps='imo-deps'
diffc() {
  diff "$@" | colordiff -Nuar
}
wdiffc() {
  wdiff "$@" | colordiff -Nuar
}
alias diffwc='wdiffc'
alias tracert='traceroute'
alias p3=python3
function a() {
  if [[ $# -gt 0 ]]; then
    source "$1"/bin/activate
  else
    source "$HOME"/.venv/bin/activate
  fi
}
