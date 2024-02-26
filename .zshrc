# https://github.com/romkatv/zsh-defer
source ~/.oh-my-zsh/custom/plugins/zsh-defer/zsh-defer.plugin.zsh

# https://github.com/Schniz/fnm
zsh-defer -t 3 eval "$(fnm env --use-on-cd)"

# https://github.com/zsh-users/zsh-completions
fpath+=~/.oh-my-zsh/custom/plugins/zsh-completions/src

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(
  aliases
  aws
  brew
  bun
  common-aliases
  # docker
  # docker-compose
  encode64
  extract
  fnm
  fzf
  git
  gitignore
  golang
  isodate
  jsontools
  macos
  npm
  python
  rsync
  starship
  sublime
  sublime-merge
  swiftpm
  universalarchive
  web-search
  xcode
  zoxide
  zsh-interactive-cd
  # 3rd party
  fzf-tab
  history-substring-search
  zsh-autosuggestions
  zsh-better-npm-completion
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

stty -ixon

COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
HIST_STAMPS="yyyy/mm/dd"

setopt CORRECT
setopt COMBINING_CHARS
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

# alias imgcat='~/.iterm2/imgcat'
# alias ssh='wezterm ssh'
# alias serial='wezterm serial'
# alias imgcat='wezterm imgcat'

alias c='cal -3'
alias emptytrash='rm -rf ~/.Trash/*'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias hist='history | fzf'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo none'
alias ips='ifconfig | grep broadcast'
alias l='eza  --classify --long --header --git --time-style=long-iso --no-permissions --no-user --icons=never'
alias la='eza --classify --long --header --git --time-style=long-iso --no-permissions --no-user --icons=never --all'
alias ll='eza --classify --long --header --git --time-style=long-iso --octal-permissions --icons=always'
alias n='~/.bin/nvim-macos/bin/nvim'
alias nvim='~/.bin/nvim-macos/bin/nvim'
alias neovim='~/.bin/nvim-macos/bin/nvim'
alias node_modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias o='open_command $PWD'
alias pp_xml="python3 -c 'import sys; import xml.dom.minidom; s=sys.stdin.read(); print(xml.dom.minidom.parseString(s).toprettyxml(indent=\"  \"))'"
alias preview='fzf --preview="bat {} --color=always"'
alias serve='python3 -m http.server 3001'
alias server='npx http-server -p 3001 --cors'
alias speedtest='networkQuality -s'
alias ss='fd --type f --hidden --exclude .git --exclude node_modules | fzf | xargs subl'
alias todo="grep --color=always --exclude-dir={.git,node_modules,.next} -RIin -E '(//|#)\s?(TODO|FIXM?E?):?' . | sed -e 's/:[ \t]*/:/g'"
alias tree='eza --tree -D'
alias v="stty stop '' -ixoff; vim"
alias vim="stty stop '' -ixoff; vim"
alias weather='curl wttr.in/cjs\?0q'
alias ytdl='yt-dlp -f mp4 --id --cookies-from-browser safari'
alias ghn='gh api notifications --template "{{range .}}{{tablerow .subject.title .subject.url}}{{end}}"'
#s() { subl "${1:-.}"; }
s() { command -v subl >/dev/null 2>&1 && { [[ -n $1 ]] && subl "$1" || subl .; } || echo "Sublime Text is not installed or not in PATH."; }

function rr { # https://github.com/mrusme/reader
  readonly u=${1:?"Reader: The url must be specified."}
  curl -A "Mozilla Firefox" -sL "$u" | reader - | less -R
}

function ya() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

gif2mp4() {
  [ $# -lt 1 ] && echo "Usage: gif2mp4 <input.gif> [output.mp4]" && return 1
  [[ ! -f "$1" ]] && echo "Error: '$1' does not exist." && return 1
  output=${2:-"${1%.*}.mp4"}
  ffmpeg -i "$1" -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "$output"
}
mov2mp4() {
  [ $# -lt 1 ] && echo "Usage: mov2mp4 <input.mov> [output.mp4]" && return 1
  [[ ! -f "$1" ]] && echo "Error: '$1' does not exist." && return 1
  output=${2:-"${1%.*}.mp4"}
  ffmpeg -i "$1" -q:v 0 "$output"
}
resize_video() {
  [[ $# -lt 2 ]] && echo "Usage: resize_video <input> <width> [output]" && return 1
  [[ ! -f "$1" ]] && echo "Error: '$1' does not exist." && return 1
  output="${3:-${1%.*}_$2.${1##*.}}"
  ffmpeg -i "$1" -filter:v "scale=$2:-1" -c:a copy "$output"
}
extract_audio() {
  [ $# -lt 1 ] && echo "Usage: extract_audio <input.mp4> [output.aac]" && return 1
  [[ ! -f "$1" ]] && echo "Error: '$1' does not exist." && return 1
  output=${2:-"${1%.*}.aac"}
  ffmpeg -i "$1" -vn -acodec copy "$output"
}
