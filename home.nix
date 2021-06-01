{ config, pkgs, ... }:

{
  imports = [
    ./modules/desktop.nix
    ./modules/gnome.nix
    ./modules/programming-haskell.nix
    ./modules/programming.nix
    ./modules/shell/bash.nix
    ./modules/shelltools.nix
    ./modules/stylus.nix
    ./modules/tex.nix
    ./modules/yubikey.nix
  ];

  programs.home-manager.enable = true;
}

