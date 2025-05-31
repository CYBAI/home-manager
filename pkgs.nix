{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    eza
    bat
    delta
    ripgrep

    gh
    jq
    btop
    mise
    direnv

    # fonts
    nerd-fonts.jetbrains-mono
  ];
}
