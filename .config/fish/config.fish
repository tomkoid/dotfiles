if status is-interactive
    # Commands to run in interactive sessions can go here
end

# PATH
export PATH="$HOME/.cargo/bin:$HOME/.surrealdb:$PATH"

source ~/.bash_aliases
fish_add_path /home/tom/.spicetify

export RUSTC_PROVIDER=sccache
export EDITOR=nvim # change default editor
starship init fish | source
zoxide init fish | source
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# source /usr/share/doc/find-the-command/ftc.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
