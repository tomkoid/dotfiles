# DOTFILES
My system dotfiles

# Install

To install the dotfiles, you only need [GNU Stow](https://www.gnu.org/software/stow/) installed.

Then clone the repository to new directory and install it:

```bash
git clone https://codeberg.org/Tomkoid/dotfiles.git tomkoid-dotfiles --recurse-submodules
cd tomkoid-dotfiles
stow .
```

**NOTE:** You may need to run `stow --adopt .` if you have already installed some dotfiles.
