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

    # editors
    vim
    vscode

    # fonts
    nerd-fonts.jetbrains-mono
  ];
}
