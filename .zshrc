(cat ~/.cache/wal/sequences &)
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel9k/powerlevel9k"

HISTSIZE= 
HISTFILESIZE=
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export TERM="xterm-256color"
export UPDATE_ZSH_DAYS=30
export ZSH=/home/nomad/.oh-my-zsh
export PATH=~/Fast2/bin:~/bin:~/.local/bin:~/azuredatastudio:$PATH
#export MANPAGER="/bin/sh -c \"col -b | vi --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git python systemd adb web-search colored-man-pages colorize compleat wd extract zsh-completions)

source $ZSH/oh-my-zsh.sh
#source /home/nomad/bin/antigen.zsh
source ~/.cache/wal/colors.sh

alias emerge="sudo emerge"
alias emerge-time="genlop -t"
alias u="sudo emerge --sync && sudo layman -S && sudo emerge -auvDU --keep-going --with-bdeps=y @world"
alias mount="sudo mount"
alias umount="sudo umount"
alias t="timew"
alias ts="timew summary"
alias nmap="sudo nmap"
alias v="vi"
alias p="ssh puppet"
alias r="ranger"
alias etc-update="sudo etc-update"
alias oscar="toilet Oscar"
alias axel="toilet Axel"
alias reboot="sudo reboot"
alias up="nmcli con up"
alias down="nmcli con down"
alias code="visual-studio-code"
alias f="fzf"
alias cdp="cd /home/nomad/Fast2/puppet/code/modules"

autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
#set -o vi

export EDITOR="vi"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
