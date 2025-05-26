{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
      tabstop = 2;
      expandtab = true;
    };

    extraConfig = ''
      set smartindent
      set softtabstop=2
      set shiftwidth=2

      set incsearch
      set hls

      set backspace=indent,eol,start
   '';
  };
}
