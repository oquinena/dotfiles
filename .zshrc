#(wal -r -t&)
setsid wal -r -t
# Path to your oh-my-zsh installation.
  export ZSH=/home/nomad/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python systemd adb web-search colored-man-pages colorized compleat wd extract zsh-completions)

source $ZSH/oh-my-zsh.sh
source ~/.cache/wal/colors.sh

alias emerge='sudo emerge'
alias nano='nano -w'
alias u="sudo emerge --sync && sudo layman -S && sudo emerge -auvDU --with-bdeps=y @world"
alias spotify='spotify --force-device-scale-factor=2'
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

export EDITOR="vim"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
