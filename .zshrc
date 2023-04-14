# zsh-defer https://github.com/romkatv/zsh-defer
source ~/.oh-my-zsh/custom/plugins/zsh-defer/zsh-defer.plugin.zsh

# fnm https://github.com/Schniz/fnm
zsh-defer -t 1 eval "$(fnm env --use-on-cd)"

# zsh-completions https://github.com/zsh-users/zsh-completions
fpath+=~/.oh-my-zsh/custom/plugins/zsh-completions/src

# https://starship.rs/
eval "$(starship init zsh)"

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(
  aws
  aliases
  brew
  common-aliases
  docker
  docker-compose
  encode64
  extract
  fnm
  fzf
  git
  gitignore
  golang
  isodate
  jsontools
  jump
  macos
  npm
  python
  sublime
  sublime-merge
  web-search
  zoxide
  zsh-interactive-cd
  # third party
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-better-npm-completion
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

stty -ixon

COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
HIST_STAMPS="yyyy/mm/dd"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY
setopt NO_SHARE_HISTORY
unsetopt SHARE_HISTORY

unset zle_bracketed_paste # Disable paste highlight

alias ssh="kitty +kitten ssh"
alias imgcat="kitty +kitten icat"

alias cat='bat'
alias cd='z'
alias c='cal -3'
alias emptytrash='rm -rf ~/.Trash/*'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias hist='history | fzf'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo none'
alias ips='ifconfig | grep broadcast'
alias l='exa  --classify --long --header --git --no-permissions --no-user'
alias la='exa --classify --long --header --git --icons --all'
alias ll='exa --classify --long --header --git --icons'
alias n='~/.bin/nvim-macos/bin/nvim'
alias nvim='~/.bin/nvim-macos/bin/nvim'
alias node_modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias o='open_command $PWD'
alias serve='python3 -m http.server 3001'
alias server='npx http-server -p 3001 --cors'
alias ss='fd --type f --hidden --exclude .git --exclude node_modules | fzf | xargs subl'
alias todo="grep --color=always --exclude-dir={.git,node_modules,.next} -RIin -E '(//|#)\s?(TODO|FIXM?E?):?' . | sed -e 's/:[ \t]*/:/g'"
alias tree='exa --classify --tree'
alias v="stty stop '' -ixoff; vim"
alias vim="stty stop '' -ixoff; vim"
alias ytdl='yt-dlp -f mp4 --id --cookies-from-browser safari'
alias weather='curl wttr.in/cjs\?1q'
alias pp_xml="python3 -c 'import sys; import xml.dom.minidom; s=sys.stdin.read(); print(xml.dom.minidom.parseString(s).toprettyxml(indent=\"  \"))'"
s() { subl "${1:-.}"; }

function rr { # https://github.com/mrusme/reader
  readonly u=${1:?"Reader: The url must be specified."}
  # wget -U "Mozilla Firefox" -qO - "$u" | reader - | less -R
  curl -A "Mozilla Firefox" -sL "$u" | reader - | less -R
}

# bun completions
zsh-defer source "/usr/local/share/zsh/site-functions/_bun"
