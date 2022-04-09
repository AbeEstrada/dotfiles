# Abe's dotfiles

This is mostly for personal use, but feel free to fork.

Inspired by Paul Irish [dotfiles](https://github.com/paulirish/dotfiles)

More about dotfiles at [http://dotfiles.github.io/](http://dotfiles.github.io/)

## Brewfile

```sh
brew bundle dump --file=~/Downloads/Brewfile
```

## Sublime Text

```python
import os; [(os.path.dirname(file)[len('Packages/'):], sublime.decode_value(sublime.load_resource(file))['url']) for file in sublime.find_resources('package-metadata.json')]
```
