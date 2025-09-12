#!/bin/zsh

# History configuration
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$HOME/.cache/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth

# Prompt Configuration
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# Append homebrew to path (https://brew.sh)
if [[ -d "/opt/homebrew" ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export HOMEBREW_PREFIX="/opt/homebrew"
fi

# Environment Variables
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="ghostty"
export TERMINAL="ghostty"
export PAGER="less"

# Language and locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Homebrew completions
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

# Initialize completion system
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Welcome Message

# Print system info on new shell (only for interactive shells)
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
	echo "Welcome back, $(whoami)! 🚀"
fi
