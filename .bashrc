#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto --group-directories-first'
alias la='ls -la'
alias ll='ls -l'
alias l='ls'
alias grep='grep --color=auto'
alias venv='python3 -m venv'
alias vim='nvim'
alias vi='vim'
alias pac='sudo pacman'
alias shutdown='shutdown now'
alias suspend='systemctl suspend'
alias r='ranger'
alias mkdir='mkdir -pv'
alias mkd='mkdir'
alias cp='cp -i'
alias df='df -h'
alias fdisk='sudo fdisk -l'
alias terminal='urxvt'
alias pk='makepkg -si'

export VISUAL=vim
export EDITOR=vim
#export PATH="$HOME/.dynamic-colors/bin:$PATH"
#source $HOME/.dynamic-colors/completions/dynamic-colors.bash
eval "$(dircolors ~/.dir_colors)"
export GSETTINGS_SCHEMA_DIR=/usr/share/glib-2.0/schemas/
export HISTSIZE=5000
export HISTFILESIZE=5000
export PS1="\e[0;31m\u \W:\e[m "
