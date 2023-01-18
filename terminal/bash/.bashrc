# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source .rc files from 1 alias directory
if [ -d "$HOME"/aliases/ ]; then
	for file in "$HOME"/aliases/.*rc*; do
        . "$file"
    done
fi

##################
# Linux OS Aliases 
##################

#Generic Commands#
alias cp='cp -pvr'
alias grep='grep -i --color=auto'
alias rm='rm -v'
alias mv='mv -v'
alias ek='ssh-add -K ~/.ssh/id_ed25519'

#Shell History Persistence#
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%d-%b-%Y %T "
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#To check processes and exclude grep command
function ps-no-grep() {
$(command -v ps) auxfww | $(command -v grep) -i "[^]]$1" --color
}

# Print ps output and GREP a particular process with headers
function ps-grep-headers() {
$(command -v ps) aux | head -1 && $(command -v ps) aux | $(command -v grep) -iE "[^]]$1" --color
}

# Find file in current DIR by md5sum, use known md5sum as argument to this command, i.e: $1#
function find-md5sum() {
$(command -v find) . -type f | $(command -v xargs) md5sum | $(command -v grep) -v .git | $(command -v grep) "$1"
}

# Hidden Files & Folders
#-----------------------

# View all hidden content
function view-hidden-all() {
$(command -v ls) -dlht .*
}

# View only hidden files
function view-hidden-files () {
$(command -v ls) -dlht .* |grep ^-
} 

# View only hidden folders
function view-hidden-folders () {
$(command -v ls) -dlht .* |grep ^d
}

# Kill CopyQ Clipboard Manager when it goes unresponsive (ONLY when scissor icon doesn't open)
function stop-copyq() {
pgrep -i "[c]opyq" | awk '{print $2}' | $(command -v xargs) kill
}

#Kill unnecessary sshd-connections#
function fix-ssh-conn () {
sudo netstat -ntulpa | $(command -v grep) "[s]shd:" | awk '{ if ($3 =="0") print $7}' | cut -d / -f1 | $(command -v xargs) sudo kill
}

#################
# Mac OSX Aliases
#################

# Deleting leftovers left by brew cask uninstall $PKGNAME - specify in $1#
function delete-cask() {
$(command -v find) ~/Library/ -iname "*$1*" -print0 | $(command -v xargs) -0 rm -vrf
}

# Upgrade all casks
function upgrade-all-casks() {
for casks in $(brew list --cask | xargs -n1); do brew upgrade "$casks" --cask ; done
}
