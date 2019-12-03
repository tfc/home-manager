{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ../modules/shell/bash.nix
    ../modules/yubikey.nix
  ];

  home.packages = with pkgs; [
    docker
    evince
    gimp
    gitg
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    hlint
    inkscape
    nerdfonts
    powerline-fonts
    python3Packages.glances
    spotify
  ];

  home.stateVersion = "19.03";
  fonts.fontconfig.enable = true;

  programs = {
    broot = {
      enable = true;
      enableBashIntegration = true;
    };
    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };
    firefox = {
      enable = true;
      extensions = [];
    };
  };
}
