# ZSH_THEME="simple"
ZSH_THEME=""

NVM_LAZY_LOAD=true
NVM_COMPLETION=true
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(
  aws
  brew
  common-aliases
  docker
  docker-compose
  encode64
  extract
  git
  gitignore
  isodate
  jsontools
  jump
  macos
  npm
  python
  sublime
  sublime-merge
  zsh-interactive-cd
  # third party
  zsh-nvm
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-better-npm-completion
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy/mm/dd"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='subl -w'
export ARCHFLAGS="-arch x86_64"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt NO_SHARE_HISTORY

# zsh-completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# https://starship.rs/
eval "$(starship init zsh)"

alias l='exa --classify --long --header --git --no-permissions --no-user'
alias ll='exa --classify --long --header --git --icons'
alias la='exa --classify --long --header --git --icons --all'
alias tree='exa --classify --tree'

alias j='jump'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo none'
alias ips='ifconfig | grep broadcast'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias node_modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias o='open_command $PWD'
alias w='curl wttr.in/cjs\?1q'
alias c='cal -3'
alias ytdl='yt-dlp -f mp4'
alias todo="grep --exclude-dir={.git,node_modules,.next} -RIin -E '//\s?(TODO|FIXM?E?):?' ."
# alias server="python3 -m http.server 3001"
alias server='npx http-server -p 3001 --cors'
s() { subl "${1:-.}"; }
