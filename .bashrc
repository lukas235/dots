#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias fucking='sudo'
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
alias pkg='makepkg -si'

export VISUAL=vim
export EDITOR=vim
#export PATH="$HOME/.dynamic-colors/bin:$PATH"
#source $HOME/.dynamic-colors/completions/dynamic-colors.bash
eval "$(dircolors ~/.dir_colors)"
export GSETTINGS_SCHEMA_DIR=/usr/share/glib-2.0/schemas/
export HISTSIZE=5000
export HISTFILESIZE=5000
# https://unix.stackexchange.com/questions/28827/why-is-my-bash-prompt-getting-bugged-when-i-browse-the-history
export PS1="\\[\e[0;31m\\]\u \W:\\[\e[m\\] "
export DISPLAY_BRIGTHNESS=100

# # fzf with fd for super fast fuzzy searching
# export FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude={.git,.cache,Music}'
# # export FZF_DEFAULT_OPTS='--ansi'
# export FZF_CTRL_T_COMMAND='fd --hidden --type f --exclude ".git"'
# export FZF_ALT_C_COMMAND='fd --hidden --type d --exclude ".git"'
# 
# # fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
. /usr/share/fzf/key-bindings.bash


