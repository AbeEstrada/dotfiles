fpath+=~/.oh-my-zsh/custom/plugins/zsh-completions/src
fpath+=/opt/homebrew/share/zsh/site-functions

plugins=(
  aliases
  aws
  brew
  bun
  common-aliases
  fzf
  gh
  git
  golang
  isodate
  jsontools
  macos
  mise
  npm
  python
  rust
  rsync
  starship
  tailscale
  xcode
  zoxide
  zsh-interactive-cd
  # 3rd party
  fzf-tab
  history-substring-search
  you-should-use
  zsh-autosuggestions
  zsh-better-npm-completion
  zsh-syntax-highlighting
  zsh-shift-select
)

zstyle ':fzf-tab:*' use-fzf-default-opts yes

source $ZSH/oh-my-zsh.sh

# Disable XON/XOFF flow control to allow Ctrl-S usage
stty -ixon

bindkey -e  # (default) emacs
bindkey "^[[1;3D" backward-word  # Alt + Left
bindkey "^[[1;3C" forward-word   # Alt + Right
bindkey \^U backward-kill-line   # Ctrl + u

COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
SAVEHIST=10000000
HISTSIZE=10000000
HIST_STAMPS="yyyy/mm/dd"
HISTORY_IGNORE="(ls|cd|pwd|exit|z)*"

setopt CHASE_LINKS             # Follow symbolic links
setopt COMBINING_CHARS         # Properly display Unicode combining characters (like accents)
setopt CORRECT                 # Enable command auto-correction
setopt EXTENDED_HISTORY        # Save timestamp and duration for each command in history
setopt HIST_FIND_NO_DUPS       # When searching history, skip duplicates
setopt HIST_IGNORE_ALL_DUPS    # Delete older duplicate entries from history
setopt HIST_IGNORE_DUPS        # Don't record a command that was just recorded
setopt HIST_IGNORE_SPACE       # Don't record commands that start with space
setopt HIST_NO_STORE           # Don't store history or fc commands in history
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blanks from commands in history
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries to history file
setopt INC_APPEND_HISTORY_TIME # Add commands to history file incrementally with timestamp
unsetopt SHARE_HISTORY         # Don't share history between different shell sessions
unset zle_bracketed_paste      # Disable paste highlight

unalias lsr # https://tangled.sh/@rockorager.dev/lsr
alias bunst='bun run start'
alias emptytrash="osascript -e 'tell application \"Finder\" to empty the trash'"
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias ghn='gh api notifications --template "{{range .}}{{tablerow .subject.title .subject.url}}{{end}}"'
alias gdu='gdu-go'
alias hist='history | fzf'
alias imgcat='kitten icat'
alias ip='curl icanhazip.com'
alias ips='ifconfig | grep broadcast'
alias l='eza  --classify --long --header --git --time-style=long-iso --no-permissions --no-user --icons=never'
alias la='eza --classify --long --header --git --time-style=long-iso --no-permissions --no-user --icons=never --all'
alias ll='eza --classify --long --header --git --time-style=long-iso --octal-permissions --bytes --icons=always'
alias lg='lazygit'
alias multipull='find . -mindepth 1 -maxdepth 1 -type d | while read -r dir; do echo "\033[32mUpdating:\033[0m $dir\n$(git -C "$dir" remote get-url origin 2>/dev/null || echo "No remote for $dir")"; git -C "$dir" pull || echo "Failed $dir"; echo; done'
alias nb='newsboat'
alias node_modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias o='open_command $PWD'
alias pp_xml="python3 -c 'import sys; import xml.dom.minidom; s=sys.stdin.read(); print(xml.dom.minidom.parseString(s).toprettyxml(indent=\"  \"))'"
alias serve='python3 -m http.server 3001'
alias speedtest='networkQuality -s'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
alias todo="grep --color=always --exclude-dir={.git,node_modules,.next,venv} -RIin -E '(//|#)\s?(TODO|FIXM?E?):?' . | sed -e 's/:[ \t]*/:/g'"
alias tree='eza --tree -D'
alias ytdl='yt-dlp -f mp4 --id --cookies-from-browser safari'
alias :q="exit"
alias :wq="exit"

termsize() {
  local width=$(tput cols)
  local height=$(tput lines)
  echo "$width x $height"
}
yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
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
concat_mp3() {
  find . -name "*.mp3" | sort | xargs -I{} echo "file '{}'" > files.txt
  ffmpeg -f concat -safe 0 -i files.txt -c copy output.mp3
  rm files.txt
}
mp3time() {
  ffmpeg -i "$1" 2>&1 | sed -nE "s/.*Duration: ([^,]*),.*/\1/p"
}
