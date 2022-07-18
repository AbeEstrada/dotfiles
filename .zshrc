NVM_LAZY=true
NVM_LAZY_LOAD=true
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(
  aws
  aliases
  brew
  common-aliases
  # docker
  # docker-compose
  encode64
  extract
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
  # web-search
  zsh-interactive-cd
  # third party
  zsh-nvm
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-better-npm-completion
  history-substring-search
)

stty -ixon

unset zle_bracketed_paste # Disable paste highlight

source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy/mm/dd"

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
alias cat='bat'

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
alias todo="grep --color=always --exclude-dir={.git,node_modules,.next} -RIin -E '(//|#)\s?(TODO|FIXM?E?):?' . | sed -e 's/:[ \t]*/:/g'"
# alias server="python3 -m http.server 3001"
alias server='npx http-server -p 3001 --cors'
alias n='~/.bin/nvim-osx64/bin/nvim'
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
