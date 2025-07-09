# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

# PATH
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:/opt/xtensa-lx106-elf-gcc/bin:$HOME/go/bin:$HOME/.surrealdb:$HOME/.fly/bin:$PATH"

source ~/.bash_aliases
# fish_add_path /home/tom/.spicetify

export RUSTC_PROVIDER=sccache
export EDITOR=nvim # change default editor
# export SSH_ASKPASSWORD='' # dont use the old ass 1955 x11 program

starship init fish | source
enable_transience
zoxide init --cmd cd fish | source
# fzf --fish | source
# [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# source /usr/share/doc/find-the-command/ftc.fish

fzf_configure_bindings --directory=\cf
fish_config theme choose "Rosé Pine"

function , --description 'add software to shell session'
  nix shell nixpkgs#$argv[1..-1]
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export QT_STYLE_OVERRIDE kvantum
