{ config, pkgs, ... }:

{
  imports = [
    ./pkgs.nix
    ./vim.nix
    ./git.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = "/Users/${config.home.username}";
  home.shellAliases = {
    cat = "bat";
    ls = "eza";
    l = "ls -alh";
    ll = "ls -lhgF --git";
  };

  programs.readline = {
    enable = true;
    extraConfig = builtins.readFile ./config/inputrc;
  };

  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "fish";
      simplified_ui = true;
      pane_frames = false;
      scroll_buffer_size = 10000;
      theme = "catppuccin-latte";
    };
  };

  programs.alacritty = {
    enable = true;

    theme = "catppuccin_frappe";

    settings = {
      cursor = {
        style = {
          blinking = "On";
        };
      };
      font = {
        size = 24;
        normal = {
          family = "JetBrains Mono";
          style = "ExtraLight";
        };
        bold = {
          style = "Bold";
        };
        italic = {
          style = "ExtraLight Italic";
        };
        bold_italic = {
          style = "Bold Italic";
        };
      };
    };
  };

  programs.bash.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./config/fish/config.fish;
    functions = {
      fish_user_key_bindings = "fish_vi_key_bindings";
    };
  };
  programs.zsh = {
    enable = true;

    completionInit = "autoload -U compinit && compinit -u";
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";

    envExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels

      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';

    history = {
      extended = true;
      path = "${config.xdg.dataHome}/zsh/.zsh_history";
      save = 1000000;
      size = 1000000;
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "lambda";
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
