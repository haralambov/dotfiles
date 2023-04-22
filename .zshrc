# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    git
    zsh-autosuggestions
    web-search
    ohmyzsh-full-autoupdate
)

source $ZSH/oh-my-zsh.sh

### CUSTOM CONFIGURATION

. "$HOME/.cargo/env"
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
alias ls='ls -F --color'
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
alias fs='sudo \df -h /'
alias jrn='sudo journalctl -p 3 -xb'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cl='clear'
alias update='paru -Syyu'
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
alias fix_keyboard="/usr/bin/setxkbmap -option \"caps:swapescape\" -option altwin:swap_alt_win"
alias \g='google'

bindkey -v # enables Vi mode

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
