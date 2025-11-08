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

    # required by yt-dlp
    ffmpeg-full

    # Python
    uv

    # Rust
    rustup

    # Lean
    elan
  ];
}
