# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:/snap/bin:/usr/local/go/bin:$GOBIN"

ZSH_THEME="robbyrussell"
UPDATE_ZSH_DAYS=14

PROMPT_EOL_MARK=''

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    web-search
    ohmyzsh-full-autoupdate
)

source $ZSH/oh-my-zsh.sh

### CUSTOM CONFIGURATION

export EDITOR=nvim
export VISUAL=nvim

# automatically start X if tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

function mfa() {
    CODE=$(oathtool -b --totp $1)
    echo $CODE | tee /dev/tty | xclip -sel clip
}

alias myip="curl http://ipecho.net/plain; echo"
alias grep='grep --color=auto'
alias py='python'
alias src='source ~/.zshrc'
alias ft='grep -RinH --exclude-dir=.git --exclude=tags '
alias ls='exa --color=always --icons'
alias ll='exa -lah --color=always --icons'
alias l='ll;'
alias b='cd ..'
alias f='cd -'
alias ram='free -h'
alias random='openssl rand -base64 48'
alias off='sudo shutdown -h now'
alias size='dust'
alias failed='sudo systemctl --failed'
alias his='history | grep '
alias fs='sudo \df -h /'
alias jrn='sudo journalctl -p 3 -xb'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cl='clear'
alias remove_orphans='pacman -Qtdq | sudo pacman -Rns'
alias clear_logs='sudo rm -rf /var/log/journal/*'
alias desk='cd ~/Desktop/'
alias doc='cd ~/Documents/'
alias down='cd ~/Downloads/'
alias proj='cd ~/Projects/'
alias wtr='curl wttr.in?FM'
alias vc='nvim ~/.config/nvim/'
alias temp='sensors | grep Core'
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
alias cal='cal -m'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias show_zombies="ps aux | grep -E \"Z|defunct\""
alias show_parent_process="ps -o ppid= -p "
alias fix_keyboard="~/Projects/dotfiles/scripts/keyboard.sh"
alias \g='google'
alias ff='~/Projects/dotfiles/scripts/ff.sh'
alias tree='exa -T'
alias cat='bat --style=numbers --color=always'
alias find='fdfind'
alias r='ranger'
alias z='zellij'
alias zs='~/Projects/dotfiles/scripts/zs.sh'

# Loading update alias, based on distro
if [[ -f /etc/debian_version ]]; then
    alias update='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove'
else
    alias update='yay -Syyu'
fi

# devour aliases
alias mpv="devour mpv"
alias zathura="devour zathura"
alias feh="devour feh"


#########
# vi mode
#########

bindkey -v

# Vim-like navigation when doing tab-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey "^X^E" edit-command-line

# switch to command mode with jj
bindkey '^j' vi-cmd-mode

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# incremental search in insert mode
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward

# beginning search with arrow keys and j/k
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# beginning search in insert mode, redundant with the up/down arrows above
# but a little easier to press.
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward

# incremental search in vi command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# navigate matches in incremental search
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward


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
