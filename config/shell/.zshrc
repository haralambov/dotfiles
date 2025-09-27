# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:/snap/bin:/usr/local/go/bin:$GOBIN"
export PAGER=""
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

ZSH_THEME="robbyrussell"
UPDATE_ZSH_DAYS=14

PROMPT_EOL_MARK=''

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    z
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    ohmyzsh-full-autoupdate
)

source $ZSH/oh-my-zsh.sh
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

### CUSTOM CONFIGURATION

export EDITOR=nvim
export VISUAL=nvim

# automatically start X if tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

alias myip="curl http://ipecho.net/plain; echo"
alias grep='grep --color=auto'
alias py='python'
alias src='source ~/.zshrc'
alias ft='grep -RinH --exclude-dir=.git --exclude=tags '
alias ls='eza --color=always --icons'
alias ll='eza -lah --color=always --icons'
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
alias tree='eza -T'
alias find='fd'
alias r='ranger'
alias fh='fastfetch'
alias mfa='~/Projects/dotfiles/scripts/mfa.sh'

# Loading update alias, based on distro
if [[ -f /etc/debian_version ]]; then
    export BROWSER="brave-browser"
    alias update='sudo apt-get update && sudo apt-get full-upgrade && sudo apt-get autoremove --purge && pkill -RTMIN+13 i3blocks'
    alias cat='batcat --theme=OneHalfDark --style=numbers --color=always'
else
    export BROWSER="brave"
    alias update='yay -Syyu && pkill -RTMIN+13 i3blocks'
    alias cat='bat --theme=OneHalfDark --style=numbers --color=always'
fi

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

# zsh-autosuggestion accept
bindkey '^E' autosuggest-accept

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

eval "$(fzf --zsh)"
