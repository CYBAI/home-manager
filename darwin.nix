{
  system.stateVersion = 6;
  system.primaryUser = builtins.getEnv "USER";

  nix.enable = false;
  nix.settings = {
    accept-flake-config = true;
    build-users-group = "nixbld";
    experimental-features = "nix-command flakes";
    bash-prompt-prefix = "(nix:$name) ";
    max-jobs = "auto";
    extra-nix-path = "nixpkgs=flake:nixpkgs";
    trusted-users = [
      "cybai"
      "root"
    ];
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix-homebrew = {
    enable = true;
    enableRosetta = true;

    user = "cybai";
  };

  homebrew = {
    enable = true;
    user = "cybai";
    casks = [
      # Editors
      "visual-studio-code"

      "google-cloud-sdk"
      "font-jetbrains-mono"
    ];
  };

  ids.gids.nixbld = 30000;
}
