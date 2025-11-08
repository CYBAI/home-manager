{
  system.stateVersion = 6;
  system.primaryUser = "cybai";

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
    brews = [
      "mise"
      "yt-dlp"
    ];
    casks = [
      # Editors
      "visual-studio-code"

      "font-jetbrains-mono"
    ];
  };

  ids.gids.nixbld = 30000;

  system.defaults = {
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
      QuitMenuItem = true;
    };
    dock = {
      autohide = true;
      largesize = 92;
      magnification = false;
      show-recents = false;
    };
    trackpad = {
      Clicking = true;
      Dragging = true;
      TrackpadThreeFingerDrag = true;
    };
  };
}
