# Coop-manager

Coop-manager is a minimal startup configuration to the world of Nix based configuration using home-manager.

Feel free to copy, fork anything in it. Have fun with it, it's not perfect but it works.

If you wonder where to start, here is a little road-map to begin your journey. The more you go down the more I think it's can be tricky (even if its not).

### Road map :

- Neovim: Add personnal keybinds
- Zsh: Add personnal aliases
- Zsh: Edit plugins
- Neovim: Add plugins and keybinds with it
- Nix: Add your own Nix packages searching [NixSearch](https://search.nixos.org/packages)
- Nix: Add a new computer to your configuration

### Depedencies :

- `nix`
- `home-manager`

### Setup :

#### On normal Linux :

Put the repository at `~/.config/` and rename it `home-manager`.

Change in `flake.nix` and `Makefile` files, all the `xavier.login` by the username on the computer.

You can now do `make` or `home-manager` to run the setup of your configuration. 

#### On Epita's afs :

TODO

### Currently made :

- Neovim
  - Lsp
  - Plugins
  - AutoCMD
  - some custom keybinds
- zsh

### Useful links :

- [Nix Wiki](https://nixos.wiki/wiki) for general syntax or configuration.
- [NixSearch](https://search.nixos.org/packages) for searching new packages.
- [Home-manager docs](https://nix-community.github.io/home-manager/) documentations of home-manager.
- [NixVim Community Page](https://nix-community.github.io/nixvim) for all about nixVim, a NeoVim configuration system.
- [My own config](https://github.com/lezib/home-manager) to get some inspiration.
- And [Google](google.com) and a good Ai (by my experience Geminy does a good job) because nix does not have ~~much~~ documentations. -_-

### Todo for Coop-manager :

- Add some documentation on the architecture of the repo.
- Add some context on what is nix, home-manager, nixvim and their roles.
