# Color prompt
    if [[ $EUID -ne 0 ]]; then
        # Regular user
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        # Root
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi

# Common shotcuts
    alias h='history'
    alias j='jobs -l'
    alias path='echo -e ${PATH//:/\\n}'
    alias now='date +"%T'
    alias nowtime=now
    alias nowdate='date +"%d-%m-%Y"'
    alias df='df -H'
    alias du='du -ch'
    alias top='htop'

# Vim
    alias vi=vim
    alias svi='sudo vi'
    alias vis='vim "+set si"'
    alias edit='vim'

# Network
    alias ping='ping -c 5'
    alias fastping='ping -c 100 -s.2'
    alias ports='netstat -tulanp'
    #alias wakeupnas01='/usr/bin/wakeonlan 00:11:11:11:11:FF' # Wakeup sleeping servers

# Firewall
    alias ipt='sudo /sbin/iptables'
    alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
    alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
    alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
    alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
    alias firewall=iptlist

# Debug webserver
    # Get web server headers
        alias header='curl -I'
    # Find out if remote server supports gzip / mod_deflate or not
        alias headerc='curl -I --compress'

# Navigation
    alias ..='cd ..'
    alias ls='ls --color=auto'
    alias ll='ls -la'
    alias l.='ls -d .* --color=auto' # Show hidden files

# Folders
    alias mkdir='mkdir -pv'

# Diff
    alias diff='colordiff'

# Mount command (human readable)
    alias mount-h='mount |column -t'

# Search
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'

# Calculating
    alias bc='bc -l'

# Hash functions
    alias sha1='openssl sha1'

# Package management
    alias apt-get='sudo apt-get'

# Terminal
    alias c='clear'

# Sudo
    alias root='sudo -i'
    #alias su='sudo -i'

# Control web servers
    alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
    alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
    alias lightyload='sudo /etc/init.d/lighttpd reload'
    alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
    alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
    alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

# System information
    # Pass options to free
        alias meminfo='free -m -l -t -h'
    # Get top process eating memory
        alias psmem='ps auxf | sort -nr -k 4'
        alias psmem10='ps auxf | sort -nr -k 4 | head -10'
    # Get top process eating cpu
        alias pscpu='ps auxf | sort -nr -k 3'
        alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
    # Get server cpu info
        alias cpuinfo='lscpu'

# Older system use /proc/cpuinfo
    #alias cpuinfo='less /proc/cpuinfo'
    # Get GPU ram on desktop/laptop
    alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Wget settings
    # This one saved by butt so many times
    alias wget='wget -c'

# Git
    alias g='git'
    alias gr='git rm -rf'
    alias gs='git status'
    alias ga='g add'
    alias gc='git commit -m'
    alias gp='git push origin master'
    alias gl='git pull origin master'

# Machine commands
if [[ $UID -ne 0 ]]; then
    # Update
    alias update='sudo apt-get upgrade'
    alias apt-get="sudo apt-get"
    alias updatey="sudo apt-get --yes"
    alias update='sudo apt-get update && sudo apt-get upgrade'
    # Power commands
    alias _reboot='sudo /sbin/reboot'
    alias _poweroff='sudo /sbin/poweroff'
    alias _halt='sudo /sbin/halt'
    alias _shutdown='sudo /sbin/shutdown'
fi

# Usefull
    alias cpProgress="rsync --progress -ravz"
    alias nocomment='grep -Ev '\''^(#|$)'\'''
    # Shoot the fat ducks in your current dir and sub dirs
        alias ducks='du -ck | sort -nr | head'
    # Gets the total disk usage on your machine
        alias totalusage='df -hl --total | grep total'
    # Shows the individual partition usages without the temporary memory values
        alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
    # Gives you what is using the most space. Both directories and files. Varies on
    # current directory
        alias most='du -hsx * | sort -rh | head -10'
    # Grabs the disk usage in the current directory
        alias usage='du -ch | grep total'