{
  description = "My home manager configuration";

  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-25.05"; # do not touch

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-25.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        # your different username on your differents 
        "xavier.login" = home-manager.lib.homeManagerConfiguration { 
          inherit pkgs;
          modules = [ 
            ({
              home.username = "xavier.login";
              home.homeDirectory = "/home/xavier.login"; # Where the ~/ dir is.
            })
            ./home.nix # general configuration
            ./share/zsh.nix    # config console
            ./share/neovim/neovim.nix # neovim config
            nixvim.homeManagerModules.nixvim
          ];
        };
      };
    };
}

