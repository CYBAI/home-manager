{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      alias = {
        s = "status -s";
        sc = "switch -c";
        cm = "commit -m";
        co = "checkout";
        can = "commit --amend --no-edit";
        df = "diff";
        dfg = "diff --staged";
        show-graph = "log --graph --abbrev-commit --pretty=oneline";
      };

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
