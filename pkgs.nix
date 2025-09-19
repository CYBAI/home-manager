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
    direnv

    rustup
    lean4
  ];
}
