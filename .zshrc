#
# ~/.zshrc
#

set -o vi
export PATH=$PATH:~/bin
export OPENER=rifle
export EDITOR=nvim
export BROWSER=firefox
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export DISPLAY_BRIGTHNESS=100
export VISUAL=nvim    
export GSETTINGS_SCHEMA_DIR=/usr/share/glib-2.0/schemas/

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%{$fg[red]%}%n %~:%b "

eval "$(dircolors ~/.dir_colors)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

# install plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# vim mode
bindkey -v
# bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

zstyle :compinstall filename '$HOME/.zshrc'

# autocomplete
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
_comp_options+=(globdots)           # Include hidden files.


setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_history
setopt complete_aliases

# aliases
source $HOME/.zsh_aliases

# for pacman: https://wiki.archlinux.org/index.php/Color_output_in_console#pacman
# uncomment Color in /etc/pacman.conf

# z returns the most used dirs
. /usr/share/z/z.sh

# fzf with fd for super fast fuzzy searching
export FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude={.git,.cache,Music}'
# export FZF_DEFAULT_OPTS='--ansi'
export FZF_CTRL_T_COMMAND='fd --hidden --type f --exclude ".git"'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/share/fzf/key-bindings.zsh

# start nvm
source /usr/share/nvm/init-nvm.sh

# use Esc+v to edit a line in an editor
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi
#eval "$(ssh-agent)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ls/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ls/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ls/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ls/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

