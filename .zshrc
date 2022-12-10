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

alias l='exa --classify --long --header --git --no-permissions --no-user'
alias ll='exa --classify --long --header --git --icons'
alias la='exa --classify --long --header --git --icons --all'
alias tree='exa --classify --tree'
alias cat='bat'
alias j='jump'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo none'
alias ips='ifconfig | grep broadcast'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias node_modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias emptytrash='rm -rf ~/.Trash/*'
alias o='open_command $PWD'
alias w='curl wttr.in/cjs\?1q'
alias c='cal -3'
alias h='history | fzf'
alias ytdl='yt-dlp -f mp4 --id'
alias todo="grep --color=always --exclude-dir={.git,node_modules,.next} -RIin -E '(//|#)\s?(TODO|FIXM?E?):?' . | sed -e 's/:[ \t]*/:/g'"
alias serve='python3 -m http.server 3001'
alias server='npx http-server -p 3001 --cors'
alias n='~/.bin/nvim-macos/bin/nvim'
alias v="stty stop '' -ixoff; vim"
alias vim="stty stop '' -ixoff; vim"
alias ss='fd --type f --hidden --exclude .git --exclude node_modules | fzf | xargs subl'
s() { subl "${1:-.}"; }

# FIX: https://bitbucket.org/dougty/sublime-compare-side-by-side/raw/master/README_COMMANDS.md
# compare() { subl --command 'sbs_compare_files {"A":"$1", "B":"$2"}'; }

# https://github.com/addyosmani/dotfiles/blob/master/.functions#L1-L17
# Simple calculator
function calc() {
  local result=""
  result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
  #                       └─ default (when `--mathlib` is used) is 20
  if [[ "$result" == *.* ]]; then
    # improve the output for decimal numbers
    printf "$result" |
    sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
        -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
        -e 's/0*$//;s/\.$//'   # remove trailing zeros
  else
    printf "$result"
  fi
  printf "\n"
}

function newtab() {
  osascript >/dev/null <<EOF
  tell application "System Events"
  tell process "Terminal" to keystroke "t" using command down
    end tell
  tell application "Terminal" to do script "$*" in front window
EOF
}

# bun completions
zsh-defer source "/usr/local/share/zsh/site-functions/_bun"
