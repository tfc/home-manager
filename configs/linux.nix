{ config, pkgs, ... }:

let
  customPackages = import ./packages { inherit pkgs; };

in {
  home.packages = with pkgs; [
    gimp
    gitg
    gpa
    haskellPackages.hindent
    hlint
    htop
    inkscape
    mosh
    nix-top
    pandoc
    shellcheck
    sloccount
    spotify
    haskellPackages.stylish-haskell
    unrar
    unzip
    zip
  ] ++ (pkgs.lib.mapAttrsToList (_: x: x) customPackages);

  home.stateVersion = "19.03";

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        ll = "ls -lsa";
        nrn = "nix repl '<nixpkgs>'";
        nrnc = "nix repl '<nixpkgs/nixos>'";
        nix-build-koma = "nix-build --option extra-substituters http://binary-cache.vpn.cyberus-technology.de --option trusted-public-keys cache.vpn.cyberus-technology.de:Snf50jUtTSHKmuv7Iz268zI9eCG8CYefCGpEq2Bt1P8= ";
      };
      profileExtra = ''
        if [ -S "/run/user/$UID/gnupg/S.gpg-agent.ssh" ]; then
          export SSH_AUTH_SOCK=/run/user/$UID/gnupg/S.gpg-agent.ssh
        fi
      '';
    };
    bat.enable = true;
    browserpass = {
      enable = true;
      browsers = [ "chromium" "firefox" ];
    };
    chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
    command-not-found.enable = true;
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    git = {
      enable = true;
      userName = "Jacek Galowicz";
      userEmail = "jacek@galowicz.de";
    };
    gnome-terminal = {
      #enable = true;
      showMenubar = false;
    };
    home-manager.enable = true;

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
