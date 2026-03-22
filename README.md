# DOTFILES

System dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Install (chezmoi)

Install chezmoi, then initialize from this repo and apply:

```bash
chezmoi init https://codeberg.org/tomkoid/dotfiles.git
chezmoi apply
```

If you want a one-liner on a fresh machine:

```bash
chezmoi init --apply https://codeberg.org/tomkoid/dotfiles.git
```

## Required local chezmoi config

Create `~/.config/chezmoi/chezmoi.toml` before applying, and set your local data values:

```toml
[data]
has_nvidia = true
```

Set `has_nvidia = true` on NVIDIA systems, or `false` otherwise.

## Hostname/system-specific behavior

Some config is selected dynamically from templates:

- `dot_config/hypr/executable_hyprland.conf.tmpl` switches monitor config based on hostname (`obsidian` gets the desktop monitor layout).
- `dot_config/hypr/custom/rules.conf.tmpl` has extra host-specific window rules for `obsidian`.
- `dot_config/hypr/custom/env.conf.tmpl` enables NVIDIA env vars only when `.has_nvidia` is true.

So the same dotfiles can adapt across machines via hostname and `~/.config/chezmoi/chezmoi.toml` data.

## Updating later

```bash
chezmoi update
```
