{ lib, pkgs, inputs, ... }:
let 
  reader = path: lib.fileContents path ;
in
  {
  fonts.fontconfig = {
    enable = true;
  };

  home = {
    packages = with pkgs; [
      gnumake # basics gcc commandes
      zsh
      oh-my-zsh
      fzf # fuzzy find
      bat # better cat
      fd
      eza # better ls
      ripgrep # grep
      nerd-fonts.caskaydia-mono
      xclip # clipboard manager
      lazygit
    ];

    sessionVariables = {
      EDITOR= "nvim";
    };

    stateVersion = "24.11"; # do not touch
  };

  # configuration of programs installed
  programs = {

    # see https://nixos.wiki/wiki/Git for some example
    git = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

  };
}
