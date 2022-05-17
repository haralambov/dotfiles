EDITOR=nvim

# Prompt settings
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White
NC="\[\e[m\]"               # Color Reset

PROMPT_COMMAND=promptCommand

export CM_MAX_CLIPS=30
export CM_SELECTIONS="clipboard"
export CM_DIR=~/.cache/clipmenu

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export PATH="$PATH:~/.local/bin"

function promptCommand() {
    local EXIT="$?"
    PS1=""
    if [ -n "$VIRTUAL_ENV" ]; then
        PS1+="${BWhite}(`basename $VIRTUAL_ENV`)${NC}"
    fi
    if [ "$EXIT" != 0 ]; then
        PS1+="${BRed}(X)${NC}"
    else
        PS1+="${BGreen}(✓)${NC}"
    fi
    PS1+="${BCyan}(\t)${NC}${BRed}[${NC}${BYellow}\u${NC}${Green}@${NC}${BBlue}\h${NC}${BRed}]${NC} ${BPurple}\W${NC} "
    local BRANCH="$(git branch 2> /dev/null | grep -e ^* | cut -d\  -f2)"
    if [ -n "$BRANCH" ]; then
        PS1+="($BRANCH)"
    fi
    PS1+='$ '
}

function mfa() {
    CODE=$(oathtool -b --totp $1)
    echo $CODE | tee /dev/tty | xclip -sel clip
}

PI_USER="pi"
PI_IP="192.168.1.2"
PI_BACKUP_PATH="/home/pi/usb/backup"

alias pi="ssh $PI_USER@$PI_IP"

function backup() {
    ssh "$PI_USER"@"$PI_IP" rm -rf "$PI_BACKUP_PATH; mkdir $PI_BACKUP_PATH"
    scp -r \
        ~/Documents \
        ~/.ssh \
        ~/.gnupg \
        ~/.password-store \
    "$PI_USER"@"$PI_IP":"$PI_BACKUP_PATH"
}

function restore() {
    if [ ! -d ~/.backup ]; then
        mkdir ~/.backup
    fi
    rm -rf ~/.backup/*
    scp -rp "$PI_USER"@"$PI_IP":"$PI_BACKUP_PATH" ~/.backup
    cp -r ~/.backup/backup/Documents ~/
    cp -r ~/.backup/backup/.ssh ~/
    cp -r ~/.backup/backup/.gnupg ~/
    cp -r ~/.backup/backup/.password-store ~/
}

function wifi_status() {
    STATUS=$(nmcli radio wifi)
    echo "Wi-Fi status: $STATUS"
}

function wifi_enable() {
    nmcli radio wifi on
    wifi_status
}

function wifi_disable() {
    nmcli radio wifi off
    wifi_status
}

function wifi_list() {
    nmcli dev wifi list
}

function wifi_connect() {
    sudo nmcli --ask dev wifi connect $1
}

function wifi_disconnect() {
    nmcli con down $1
}

function to_upper() {
    echo $1 | tr a-z A-Z
}

function stock() {
    SYMBOL=$(to_upper $1)
    curl https://terminal-stocks.herokuapp.com/$SYMBOL
}

function stock_historical() {
    SYMBOL=$(to_upper $1)
    if [ "$2" ]; then
        curl https://terminal-stocks.herokuapp.com/historical/$SYMBOL?page=$2
    else
        curl https://terminal-stocks.herokuapp.com/historical/$SYMBOL
    fi
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

alias myip="curl http://ipecho.net/plain; echo"
alias grep='grep --color=auto'
alias py='python3.9'
alias src='source ~/.bashrc'
alias ft='grep -RinH --exclude-dir=.git --exclude=tags '
alias ls='ls --color'
alias ll='ls -lah --color'
alias l='ll;'
alias b='cd ..'
alias f='cd -'
alias ram='free -h'
alias random='openssl rand -base64 48'
alias off='sudo shutdown -h now'
alias size='du -sh '
alias failed='sudo systemctl --failed'
alias his='history | grep '
alias fs='sudo \df -h'
alias jrn='sudo journalctl -p 3 -xb'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cl='clear'
alias update='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove'
alias clear_logs='sudo rm -rf /var/log/journal/*'
alias desk='cd ~/Desktop/'
alias doc='cd ~/Documents/'
alias down='cd ~/Downloads/'
alias proj='cd ~/Projects/'
alias wtr='curl wttr.in/sofia'
alias vc='nvim ~/.config/nvim/init.vim'
alias temp='sensors | grep Core'
alias sf='screenfetch -N'
alias reboot='sudo shutdown -r now'
alias swap_alt_win='setxkbmap -option;setxkbmap -option "altwin:swap_alt_win,caps:swapescape"'
alias swap_win_alt='setxkbmap -option;setxkbmap -option "altwin:swap_win_alt,caps:swapescape"'
alias swapcaps='setxkbmap -option caps:swapescape'
alias copy='xclip -selection clipboard -i '
alias copy_image='xclip -selection clipboard -t image/png -i '
alias notes='cd ~/Documents/notes && vim'
alias todos='cd ~/Documents/notes && vim todos'
alias restart_spotifyd='systemctl --user restart spotifyd.service'
alias slp='sudo systemctl suspend'
alias less='less -S'

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias show_zombies="ps aux | grep -E \"Z|defunct\""
alias show_parent_process="ps -o ppid= -p "

# set -o vi # enables vim mode

# Allows you to cd into directory merely by typing the directory name
shopt -s autocd

# automatically start X if tty1
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
    startx
fi
