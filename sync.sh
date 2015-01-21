#!/bin/bash
cd "$(dirname "$0")"
rsync --exclude ".git/" --exclude ".gitignore" --exclude ".DS_Store" \
      --exclude "README.md" --exclude "LICENSE.md" --exclude "sync.sh" \
      --exclude "Monokai Soda.terminal" --exclude "Preferences.sublime-settings" \
      -avh . ~
