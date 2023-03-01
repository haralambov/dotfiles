# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



### CUSTOM CONFIGURATION

. "$HOME/.cargo/env"
export EDITOR=nvim

# automatically start X if tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

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

function pomodoro_work_session() {
    notify-send -t 2000 -i ~/Projects/dotfiles/images/work.png "Time for work" "Session ends at $(get_pomodoro_time 25)"
    $(play_notification)
    sleep 25m
}

function pomodoro_short_break() {
    notify-send -t 2000 -i ~/Projects/dotfiles/images/break.png "Short break" "Get back at $(get_pomodoro_time 5)"
    $(play_notification)
    sleep 5m
}

function pomodoro_long_break() {
    notify-send -t 2000 -i ~/Projects/dotfiles/images/break.png "Long break" "Get back at $(get_pomodoro_time 25)"
    $(play_notification)
    sleep 25m
}

function get_pomodoro_time() {
    date --date="+ $1 minutes" +"%H:%M"
}

function play_notification() {
    play -q ~/Projects/dotfiles/sounds/notification.mp3
}

function full_pomodoro() {
    for i in {1..3}
    do
        pomodoro_work_session
        pomodoro_short_break
    done
    pomodoro_work_session
    pomodoro_long_break
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
alias update='sudo paru -Syyu'
alias remove_orphans='pacman -Qtdq | sudo pacman -Rns'
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
alias cal='cal -m'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias show_zombies="ps aux | grep -E \"Z|defunct\""
alias show_parent_process="ps -o ppid= -p "

