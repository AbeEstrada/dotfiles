export PATH=$HOME/.bin:/usr/local/bin:$PATH

export ZSH="/Users/Abe/.oh-my-zsh"

ZSH_THEME=""

ZSH_AUTOSUGGEST_USE_ASYNC=true
NVM_LAZY_LOAD=true

plugins=(
  zsh_reload
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
  aws
  brew
  common-aliases
  compleat
  docker
  docker-compose
  extract
  git
  jsontools
  jump
  node
  npm
  nvm
  osx
  sublime
  yarn
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='subl -w'
fi

export ARCHFLAGS="-arch x86_64"
setopt HIST_FIND_NO_DUPS

# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:branch color 076
zstyle :prompt:pure:git:arrow color 255
prompt pure

alias j="jump"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo none"
alias flushdns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias dockerstop='docker stop $(docker ps -q)'
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
s() { [ $# -eq 0 ] && {subl .} || subl "$@" } # Sublime Text
o() { [ $# -eq 0 ] && {open .} || open "$@" } # Finder
