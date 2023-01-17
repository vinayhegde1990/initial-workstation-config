# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

########################
# Linux Based OS Aliases 
########################

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


#IP Networking functions#
#-----------------------#
#Free IP finder, use desired subnet as argument to this command, i.e: $1#
function check-free-ips() {
for i in $(sudo nmap -sP "$1" | /usr/bin/grep -i 'Nmap scan report for' | awk '{print $5}') ;do ping -c 1 "$i";done | $(command -v grep) from
}

#Find Your Public IP#
alias public-ip='$(command -v curl) https://ipinfo.io/ip'

#IP Count#
function count-ip() {
/sbin/ifconfig | $(command -v grep) -Ev '(inet6|127)' | $(command -v grep) en0 | awk -F: '{print $2}' | cut -d' ' -f1
}

#Summarize A records with TTL for multiple domains passed as space-separated arguments
function dns-list-address-records() {
for domains in "$@"; do $(command -v dig) +noall +answer "$domains" | bat -l yaml ; done
}

#Internet Check
function internet-check() {
$(command -v ping) 8.8.8.8
}
#---------------------#


#openSSL shortcuts#
#-----------------#

#Check a domain name for its SSL certificate, provide it as $1#
function cert-domain(){
echo | openssl s_client -showcerts -servername "$1" -connect "$1":443 2>/dev/null | openssl x509 -inform pem -noout -text | /usr/bin/grep -Eiw '(issuer|not|subject:)' --color
}

#Decode SSL certificate, provide file-name as argument to this command as $1#
function cert-decoder() {
/usr/bin/openssl x509 -in "$1" -text -noout | /usr/bin/grep -Eiw '(issuer|not|subject:)'
}

#Decode CSR, provide file-name as argument to this command as $1#
function csr-decoder() {
$(command -v openssl) req -in "$1" -text -noout | $(command -v grep) -Eiw 'subject:'
}

#Find SSL sha512sum for SSL certificate via openssl, provide file-name as argument to this command, as $1#
function ssl-cert-sha512() {
$(command -v openssl) x509 -noout -modulus -in "$1" | $(command -v openssl) sha512
}

#Find SSL sha512sum for private key via openssl, provide file-name as argument to this command, as $1#
function ssl-key-sha512() {
$(command -v openssl) rsa -noout -modulus -in "$1" | $(command -v openssl) sha512
}

#Find SSL sha512sum for CSR via openssl, provide file-name as argument to this command, as $1#
function ssl-csr-sha512() {
$(command -v openssl) req -noout -modulus -in "$1" | $(command -v openssl) sha512
}

#-----------------#

#Kill unnecessary sshd-connections#
function fix-ssh-conn () {
sudo netstat -ntulpa | $(command -v grep) "[s]shd:" | awk '{ if ($3 =="0") print $7}' | cut -d / -f1 | $(command -v xargs) sudo kill
}


#Git Shortcuts#
#-------------#
# Setting upstream on creating a new branch in any GIT repo
function git-new-upstream () {
git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
}

# Check if branch on local exists on remote, provide branch name as $1
function git-remote-check () {
git ls-remote --heads origin "$1"
}

# Git branch on iTerm2 prompt, works ONLY in Git repo folders
function parse-git-branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u \W\[\033[32m\]\$(parse-git-branch)\[\033[00m\] $ "


#AWS Shortcuts
#------------#
function aws-infra-list () {
$(command -v aws) ec2 describe-instances --filters  "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[ [Tags[?Key==`Name`].Value][0][0],PublicIpAddress,State.Name ]' --output table | sort -n | grep -v +
}

function aws-ecr-docker-login () {
 profile_name="$1"
 ecr_registry_url="$(aws ecr get-authorization-token --output text --profile "$profile_name" | cut -f4)"
 aws ecr get-login-password --profile "$profile_name" | docker login --password-stdin -u AWS "$ecr_registry_url"
}

#Docker Shortcuts
#---------------#
function dockertags () {
$(command -v curl) -sS "https://registry.hub.docker.com/v1/repositories/$1/tags" | jq '.[]["name"]' | cut -d'"'| sort -n
}

function docker-inspect-images() {
$(command -v docker) inspect "$@" --format "{{.RepoTags}} {{.Architecture}}"
}

#######################
# Mac OSX Based Aliases
#######################

# Deleting leftovers left by brew cask uninstall $PKGNAME - specify in $1#
function delete-cask() {
$(command -v find) ~/Library/ -iname "*$1*" -print0 | $(command -v xargs) -0 rm -vrf
}

# Upgrade all casks
function upgrade-all-casks() {
for casks in $(brew list --cask | xargs -n1); do brew upgrade "$casks" --cask ; done
}
