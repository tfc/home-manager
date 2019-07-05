{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];
  home.packages = with pkgs; [
    gimp
    gitg
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    hlint
    inkscape
    spotify
  ];

  #home.stateVersion = "19.03";

  programs = {
    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };
    firefox = {
      enable = true;
      extensions = [];
    };
  };

  services = {
    gnome-keyring.components = [ "pkcs11" "secrets" ]; # no SSH
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };
}
