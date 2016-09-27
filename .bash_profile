for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
type shopt &> /dev/null && shopt -s histappend  # append to history, don't overwrite it

# Increase the number of proceses limit
ulimit -n 2048

# Make some commands not show up in history
#export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# Disable Software Flow Control (XON/XOFF flow control)
stty -ixon

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Immediately add a trailing slash when autocompleting symlinks to directories
set mark-symlinked-directories on

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
set match-hidden-files off

# Show all autocomplete results at once
set page-completions off

# Immediately show all possible completions
set show-all-if-ambiguous on

# If there are more than 200 possible completions for a word, ask to show them all
set completion-query-items 200

# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
set input-meta on
set output-meta on
set convert-meta off

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prevent file overwrite on stdout redirection
# set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Prepend cd to directory names automatically
shopt -s autocd

# Correct spelling errors during tab-completion
shopt -s dirspell

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# init rbenv
# eval "$(rbenv init -)"

# init virtualenvwrapper
# source "/usr/local/bin/virtualenvwrapper.sh"

# z
# if [ -f /usr/local/etc/profile.d/z.sh ]; then
#     . /usr/local/etc/profile.d/z.sh
# fi

# bash-completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# nvm
export NVM_DIR=~/.nvm
if [ -f /usr/local/opt/nvm/nvm.sh ]; then
    source /usr/local/opt/nvm/nvm.sh
fi

# marks autocomplete
_completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completemarks j jump unmark
