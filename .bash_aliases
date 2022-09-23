# reload .bash_aliases
alias rl="source ~/.bash_aliases && source ~/.dots"

# rust replacements
alias ls="lsd -la"
#alias cat="bat"
alias ps="procs"

# tomkoid-repo
alias tomkoid-repo-build="export currentdir=$PWD && cd ~/Documents/tomkoid-repo && sh build.sh && cd $currentdir"

# clear
alias cl="clear && pfetch"

# use doas instead sudo
alias sudo="doas"

alias up="yes | sudo pacman -Syyu"
alias upd="sudo pacman -Sy"
alias upg="sudo pacman -Su"
alias inst="sudo pacman -S"
alias remov="sudo pacman -Rddns"

alias do_some="brightnessctl set 1%"
alias undo_some="brightnessctl set 100%"

alias pacshow="sh ~/Stuff/scripts/pacshow.sh"

# vpns
alias vpn-connect="nmcli connection up \"MAIN VPN\""
alias vpn-disconnect="nmcli connection down \"MAIN VPN\""

# rust
alias rust_debug="mold -run cargo run --"
alias rust_release="mold -run cargo build --release"

# git
alias ginit="git init"
alias gstatus="git status"
alias gadd="git add"
alias gcommit="git commit -am"
alias gbranch="git branch"
alias gradd="git remote add"
alias gpush="git push -u"
alias grm="git rm --cached"

# dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME'

# gpg management
alias export-key="gpg --export --armor --output exported.key"

video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}
