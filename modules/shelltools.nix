{ pkgs, ... }:

let
  customPackages = with import ../packages { inherit pkgs; }; [
    neovim
    tmux
  ];
in {
  home.packages = with pkgs; [
    htop
    magic-wormhole
    mosh
    nix-top
    nixops
    unrar
    unzip
    zip
  ];

  programs = {
    bat.enable = true;
    command-not-found.enable = true;
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
