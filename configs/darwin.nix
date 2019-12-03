{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./textmedia.nix
    ../modules/shell/zsh.nix
    ../modules/yubikey.nix
  ];
}
