# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

## iTerm2 settings
# 1. Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# 2. Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# 3. Set bash auto-completion in iTerm2 (VERY IMP for tools like brew, git, docker, kubectl)
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# 4. Setting Locale to EN-US
export LC_ALL=en_US.UTF-8

# 5. Remove "The default interactive shell is now zsh" message in macOS
export BASH_SILENCE_DEPRECATION_WARNING=1
