# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

# PATH
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:/opt/xtensa-lx106-elf-gcc/bin:$HOME/go/bin:$HOME/.surrealdb:$HOME/.fly/bin:$PATH"

# use other newt colors
export NEWT_COLORS='root=black,black;window=black,black;border=white,black;listbox=white,black;label=blue,black;checkbox=red,black;title=green,black;button=white,red;actsellistbox=white,red;actlistbox=white,gray;compactbutton=white,gray;actcheckbox=white,blue;entry=lightgray,black;textbox=blue,black'

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


# If on NixOS
if test (grep '^ID=' /etc/os-release | cut -d'=' -f2) = "nixos"
    direnv hook fish | source
end

# Use kitten ssh if on kitty
if test "$TERM" = "xterm-kitty"
    alias ssh="kitten ssh"
end

function , --description 'add software to shell session'
  nix shell nixpkgs#$argv[1..-1]
end

function fish_command_not_found \
    --description 'Called by Fish when a command is not found'

    set purple \e\[1\;35m
    set bright \e\[0\;1m
    set green \e\[1\;32m
    set reset \e\[0m
    echo "fish: command not found: $argv[1]"
    if test -f /usr/bin/pacman
        set entries ( /usr/bin/pkgfile -- "/usr/bin/$argv[1]" | string split '\n' )

        if test (count $entries) -gt 0
            printf "$bright$argv[1]$reset may be found in the following packages:\n"
            for entry in $entries
                set parts (string split / $entry)
                printf "$green%s$reset$purple/%s$reset\n" $parts[1] $parts[2]
            end
        end

        return 127
    end
    # exit 97
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export QT_STYLE_OVERRIDE kvantum
