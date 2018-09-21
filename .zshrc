(cat ~/.cache/wal/sequences &)
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel9k/powerlevel9k"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export TERM="xterm-256color"
export UPDATE_ZSH_DAYS=30
export ZSH=/home/nomad/.oh-my-zsh
export PATH=~/bin:~/.local/bin:$PATH
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git python systemd adb web-search colored-man-pages colorize compleat wd extract zsh-completions svn)

source $ZSH/oh-my-zsh.sh
source ~/.cache/wal/colors.sh

alias emerge="sudo emerge"
alias nano="nano -w"
alias u="sudo emerge --sync && sudo layman -S && sudo emerge -auvDU --with-bdeps=y @world"
alias mount="sudo mount"
alias umount="sudo umount"
alias t="~/.config/ssh_tv.sh"
alias tm="sshfs nomad@tv:/ /mnt/tv && cd /mnt/tv"
alias nmap="sudo nmap"
alias v="vim"
alias r="ranger"
alias etc-update="sudo etc-update"
alias oscar="toilet Oscar"
alias axel="toilet Axel"
alias reboot="sudo reboot"
alias vup="nmcli con up"
alias vdown="nmcli con down"

autoload -U compinit promptinit
compinit
#set -o vi

export EDITOR="vim"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish
