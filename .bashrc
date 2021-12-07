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
alias desk='cd /home/zlatomir/Desktop/'
alias doc='cd /home/zlatomir/Documents/'
alias down='cd /home/zlatomir/Downloads/'
alias proj='cd /home/zlatomir/Projects/'
alias wtr='curl wttr.in/sofia'
alias vc='nvim ~/.config/nvim/init.vim'
alias temp='sensors | grep Core'
alias sf='screenfetch'
alias reboot='sudo shutdown -r now'
alias swap_alt_win='setxkbmap -option;setxkbmap -option altwin:swap_alt_win'
alias swap_win_alt='setxkbmap -option;setxkbmap -option altwin:swap_win_alt'
alias swapcaps='setxkbmap -option caps:swapescape'
alias copy='xclip -selection clipboard -i '
alias copy_image='xclip -selection clipboard -t image/png -i '
alias notes='cd ~/Documents/notes && vim'
alias todos='cd ~/Documents/notes && vim todos'
alias spotify='(spotify --no-zygote &) && exit'
alias slp='sudo systemctl suspend'

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias show_zombies="ps aux | grep -E \"Z|defunct\""
alias show_parent_process="ps -o ppid= -p "

set -o vi

# automatically start X if tty1
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
    startx
fi
