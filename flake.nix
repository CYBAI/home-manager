{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nix-darwin,
      flake-parts,
      ...
    }:
    
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        darwinConfigurations.cybai = nix-darwin.lib.darwinSystem {
          modules = [ ./darwin.nix ];
        };
      };

      systems = [ "aarch64-darwin" ];

      perSystem =
        {
          pkgs,
          lib,
          ...
        }:
        {
          legacyPackages.homeConfigurations.cybai = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [ ./home.nix ];
          };
        };
    };
}
