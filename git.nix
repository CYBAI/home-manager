{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    aliases = {
      s = "status -s";
      cm = "commit -m";
      can = "commit --amend --no-edit";
      show-graph = "log --graph --abbrev-commit --pretty=oneline";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        navigate = true;
        side-by-side = true;
      };
    };

    extraConfig = {
      color = {
        ui = "auto";
      };

      init = {
        defaultBranch = "main";
      };

      user.name = "cybai";
      user.email = "cyb.ai.815@gmail.com";
    };
  };
}

