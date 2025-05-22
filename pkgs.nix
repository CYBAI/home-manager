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
    tmux
    direnv

    # editors
    vim
    vscode

    # fonts
    nerd-fonts.jetbrains-mono
  ];
}
