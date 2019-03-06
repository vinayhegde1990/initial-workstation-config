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
alias disksize='/usr/bin/df -hx tmpfs'
alias ek='ssh-add -K ~/.ssh/id_ed25519'

#To check processes and exclude grep command
function ps-no-grep() {
/bin/ps auxfww | /bin/grep -i '[^]]'$1'' --color
}

# Print ps output and GREP a particular process with headers
function ps-grep-headers() {
/bin/ps aux | head -1 && /usr/bin/sudo ps aux | /usr/bin/grep -iE '[^]]'$1'' --color
}

#IP Networking functions#
#-----------------------#
#Free IP finder, use desired subnet as argument to this command, i.e: $1#
function check-free-ips() {
for i in `sudo nmap -sP $1 | /usr/bin/grep -i 'Nmap scan report for' | awk '{print $5}'`;do ping -c 1 $i;done | /usr/bin/grep from
}

#Find Your Public IP#
alias public-ip='/usr/bin/curl http://ipinfo.io/ip'

#Pinging IPs, from an already saved file, use it as argument to this command, i.e: $1#
function pingtest() {
for i in `cat $1`; do echo -e "=======ping for $i========\n";/sbin/ping -c 5 $i; echo -e "-------\n";done
}

#IP Count#
function count-ip() {
/sbin/ifconfig | /usr/bin/egrep -v '(inet6|127)' | grep en1 | awk -F: '{print $2}' | cut -d' ' -f1
}

#DNS Records in a clean Display#
function dns-simple() {
/usr/bin/dig +noall +answer $1
}

#Internet Check
function internet-check() {
/sbin/ping 8.8.8.8
}
#---------------------#


#openSSL shortcuts#
#-----------------#

#Check a domain name for its SSL certificate, provide it as $1#
function cert-domain(){
echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text | /usr/bin/egrep -iw '(issuer|not|subject:)' --color
}

#Decode SSL certificate, provide file-name as argument to this command as $1#
function cert-decoder() {
sudo /usr/bin/openssl x509 -in $1 -text -noout | /usr/bin/egrep -iw '(issuer|not|subject:)'
}

#Decode CSR, provide file-name as argument to this command as $1#
function csr-decoder() {
sudo /usr/bin/openssl req -in $1 -text -noout | /usr/bin/grep -iw 'subject:'
}

#Find SSL md5sum for SSL certificate via openssl, provide file-name as argument to this command, as $1#
function ssl-cert-md5() {
sudo /usr/bin/openssl x509 -noout -modulus -in $1 | /usr/bin/openssl md5
}

#Find SSL md5sum for private key via openssl, provide file-name as argument to this command, as $1#
function ssl-key-md5() {
sudo /usr/bin/openssl rsa -noout -modulus -in $1 | /usr/bin/openssl md5
}

#Find SSL md5sum for CSR via openssl, provide file-name as argument to this command, as $1#
function ssl-csr-md5() {
sudo /usr/bin/openssl req -noout -modulus -in $1 | /usr/bin/openssl md5
}

#-----------------#

#YAML Checker#
function check_yaml () {
#for i in `find . -iname "*.yaml"` ;do echo $i ; ruby -e "require 'yaml'; YAML.parse(File.open('$i'))" ;done
for i in `find . -iname "*.yaml"` ;do echo $i ; yamllint $i ;done
}

#Kill unnecessary sshd-connections#
function fix-ssh-conn () {
sudo netstat -ntulpa | /usr/bin/grep [s]shd: | awk '{ if ($3 =="0") print $7}' | cut -d / -f1 | xargs sudo kill
}

#User specific shortcuts#
export HISTTIMEFORMAT="%d-%b-%Y %T "
export HISTSIZE=999999999

#Git Shortcuts#
#-------------#
# Setting upstream on creating a new branch in any GIT repo
function git-new-upstream () {
git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

# Check if branch on local exists on remote, provide branch name as $1
function git-remote-check () {
git ls-remote --heads origin $1
}

#######################
# Mac OSX Based Aliases
#######################

# Deleting leftovers left by brew cask uninstall $PKGNAME - specify in $1#
function delete-cask() {
/usr/bin/find ~/Library/ -iname *$1* -print0 | xargs -0 rm -vrf
}
