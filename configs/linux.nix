{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];
  home.packages = with pkgs; [
    evince
    docker
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
    bash = {
      profileExtra = ''
        export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
      '';
    };
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

  services = {
    gnome-keyring.components = [ "pkcs11" "secrets" ]; # no SSH
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };
}
