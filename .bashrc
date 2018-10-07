# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#Generic Aliases#
alias cp='cp -pvr'
alias grep='grep -i --color=auto'
alias rm='rm -v'
alias mv='mv -v'
alias disksize='/usr/bin/df -hx tmpfs'
alias ek='ssh-add -K ~/.ssh/id_rsa'

#To check processes and exclude grep command
function ps-sq-grep() {
/bin/ps aux | /usr/bin/grep -i $1 | /usr/bin/grep -iv grep
}

#IP Address functions#
#--------------------#
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

#DNS Records made Simple#
function dns-simple() {
/usr/bin/dig +noall +answer $1
}
#---------------------#


#openSSL shortcuts#
#-----------------#

#Check a domain name for its SSL certificate, provide it as $1
function cert-domain(){
echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text | /usr/bin/egrep -iw '(issuer|not|subject:)' --color
}

#Decode SSL certificate, provide file-name as argument to this command, i.e: $1#
function cert-decoder() {
sudo /usr/bin/openssl x509 -in $1 -text -noout | /usr/bin/egrep -iw '(issuer|not|subject:)'
}

#Decode CSR, provide file-name as argument to this command, i.e: $1#
function csr-decoder() {
sudo /usr/bin/openssl req -in $1 -text -noout | /usr/bin/grep -iw 'subject:'
}

#Find SSL md5sum for SSL certificate via openssl, provide file-name as argument to this command, i.e: $1#
function ssl-cert-md5() {
sudo /usr/bin/openssl x509 -noout -modulus -in $1 | /usr/bin/openssl md5
}

#Find SSL md5sum for private key via openssl, provide file-name as argument to this command, i.e: $1#
function ssl-key-md5() {
sudo /usr/bin/openssl rsa -noout -modulus -in $1 | /usr/bin/openssl md5
}

#Find SSL md5sum for CSR via openssl, provide file-name as argument to this command, i.e: $1#
function ssl-csr-md5() {
sudo /usr/bin/openssl req -noout -modulus -in $1 | /usr/bin/openssl md5
}

#-----------------#

#YAML Checker#
function check_yaml () {
for i in `find . -iname "*.yaml"` ;do echo $i ; ruby -e "require 'yaml'; YAML.parse(File.open('$i'))" ;done
}


#Kill unnecessary sshd-connections#
function fix-ssh-conn () {
sudo netstat -ntulpa | /usr/bin/grep [s]shd: | awk '{ if ($3 =="0") print $7}' | cut -d / -f1 | xargs sudo kill
}

#User specific shortcuts
export HISTTIMEFORMAT="|%d.%m.%y|%T| "
export HISTSIZE=9999999
