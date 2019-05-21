{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  programs.bash.profileExtra = ''
    export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
  '';
}
