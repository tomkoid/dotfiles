# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

# PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/opt/xtensa-lx106-elf-gcc/bin:$HOME/go/bin:$HOME/.surrealdb:$PATH"

source ~/.bash_aliases
# fish_add_path /home/tom/.spicetify

export RUSTC_PROVIDER=sccache
export EDITOR=nvim # change default editor
starship init fish | source
zoxide init fish | source
# [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# source /usr/share/doc/find-the-command/ftc.fish

function , --description 'add software to shell session'
  nix shell nixpkgs#$argv[1..-1]
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
