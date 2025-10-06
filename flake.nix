{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nix-homebrew,
      nix-darwin,
      flake-parts,
      ...
    }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      flake = {
        darwinConfigurations.${builtins.getEnv "HOSTNAME"} = nix-darwin.lib.darwinSystem {
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            ./darwin.nix
          ];
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

          # This enables `nix fmt`.
          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              fish_indent.enable = true;
              nixfmt.enable = true;
              shfmt.enable = true;
              stylua.enable = true;
            };
          };
        };
    };
}
