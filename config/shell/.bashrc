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
        PS1+="($BRANCH) "
    fi
    PS1+='❱❱❱ '
}

function mfa() {
    CODE=$(oathtool -b --totp $1)
    echo $CODE | tee /dev/tty | xclip -sel clip
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
alias update='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove && sudo snap refresh'
alias remove_residual_packages="sudo apt-get remove --purge $(dpkg -l | grep \"^rc\" | awk '{print $2}')"
alias clear_logs='sudo rm -rf /var/log/journal/*'
alias desk='cd ~/Desktop/'
alias doc='cd ~/Documents/'
alias down='cd ~/Downloads/'
alias proj='cd ~/Projects/'
alias wtr='curl wttr.in?FM'
alias vc='nvim ~/.config/nvim/'
alias temp='sensors | grep Core'
alias sf='screenfetch'
alias reboot='sudo shutdown -r now'
alias swap_alt_win='setxkbmap -option;setxkbmap -option "altwin:swap_alt_win,caps:swapescape"'
alias swap_win_alt='setxkbmap -option;setxkbmap -option "altwin:swap_win_alt,caps:swapescape"'
alias swapcaps='setxkbmap -option caps:swapescape'
alias copy='xclip -selection clipboard -i '
alias copy_image='xclip -selection clipboard -t image/png -i '
alias notes='cd ~/Documents/notes && vim'
alias todos='cd ~/Documents/notes && vim todos'
alias slp='sudo systemctl suspend'
alias less='less -S'
alias up='uptime -p'
alias cal='ncal -M -b'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'

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

. "$HOME/.cargo/env"
