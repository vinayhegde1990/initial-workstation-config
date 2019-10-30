# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

## iTerm2 settings
# 1. Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# 2. Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# 3. Set bash auto-completion in iTerm2
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
