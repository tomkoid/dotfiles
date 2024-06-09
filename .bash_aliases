set EDITOR "nvim"

# reload .bash_aliases
alias rl="source ~/.bash_aliases"

# launch zellij
alias zj="zellij"

# NIXOS
## change package configs
alias cs="$EDITOR /home/tom/system"
alias ch="$EDITOR /home/tom/system/home"

## rebuild system and home manager
alias rs="sudo nixos-rebuild switch --flake /home/tom/system#nixos"
alias rh="home-manager switch --flake /home/tom/system#tom@tomkoid"

## use nix-shell for trying new things
alias try="nix-shell --command zsh -p"

## quick nix develop 
alias d="nix develop --command zsh"

# run command using distrobox with arch image
alias archrun="distrobox enter archlinux --"

# gitea (tea)
alias newrepo="tea repo create"

# rust replacements
alias ls="eza -l"
#alias cat="bat"
alias ps="procs"

# lazygit
alias lg="lazygit"

# tomkoid-repo
alias tomkoid-repo-build="export currentdir=$PWD && cd ~/Documents/tomkoid-repo && sh build.sh && cd $currentdir"

# clear
alias cl="clear && pfetch"

# use doas instead sudo
#alias sudo="doas"

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
alias gnoassumeunchanged="git update-index --no-assume-unchanged"
alias gassumeunchanged="git update-index --assume-unchanged"
alias gskipworktree="git update-index --skip-worktree"

# helix
# alias hx="helix"

# mpv
alias play-yt='mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --msg-level=all=no,ytdl_hook=trace --ytdl-format=22'

# yt-dlp
alias download-mp3='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'

# dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME'

# gpg management
alias export-key="gpg --export --armor --output exported.key"

# misc
alias bat="bat --theme='Catppuccin-mocha'"
alias paru="paru --bottomup"
# alias ssh="kitty +kitten ssh"

# display image in kitty
alias img="kitty +kitten icat"

# set wallpaper in wlroots
alias wl="~/Scripts/wallpaper.sh"

# video2gif() {
#   ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
#   ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
#   rm "${1}.png"
# }
