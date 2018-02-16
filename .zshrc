wal -R
export ZSH=/home/nomad/.oh-my-zsh
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel9k/powerlevel9k"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=30
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git python systemd adb web-search colored-man-pages colorize compleat wd extract zsh-completions)

source $ZSH/oh-my-zsh.sh
source ~/.cache/wal/colors.sh

alias emerge="sudo emerge"
alias nano="nano -w"
alias u="sudo emerge --sync && sudo layman -S && sudo emerge -auvDU --with-bdeps=y @world"
alias spotify="spotify --force-device-scale-factor=2"
alias mount="sudo mount"
alias umount="sudo umount"
alias t="/home/nomad/.config/ssh_tv.sh"
alias d="/home/nomad/.config/ssh_dc.sh"
alias dm="sshfs daoq@dcserver:/ /mnt/dcserver && cd /mnt/dcserver"
alias tm="sshfs nomad@tv:/ /mnt/tv && cd /mnt/tv"
alias nmap="sudo nmap"
alias v="vim"
alias r="ranger"
alias krebuild="sudo mount /boot && sudo make -j8 && sudo make install modules_install && sudo genkernel ramdisk && sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias etc-update="sudo etc-update"

autoload -U compinit promptinit
export PATH=~/bin:~/.local/bin:$PATH
compinit
set -o vi

export EDITOR="vim"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
