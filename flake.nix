{
  description = "zuko's dotfiles";

  # inputs are other flakes you use within your own flake, dependencies
  # if you will
  inputs = {
    # unstable has the 'freshest' packages you will find, even the AUR
    # doesn't do as good as this, and it's all precompiled.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # In this context, outputs are mostly about getting home-manager what it
  # needs since it will be the one using the flake
  outputs = { nixpkgs, home-manager, ... }:

   let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      in {
        homeConfigurations.zuko = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    
    packages.${system}.default = home-manager.defaultPackage.${system};
  };

  #{
   # homeConfigurations = {
    #  "zuko" = home-manager.lib.homeManagerConfiguration {
        # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
     #   pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      #  modules = [ ./home.nix ];
#      };
#    };
 # };
}
