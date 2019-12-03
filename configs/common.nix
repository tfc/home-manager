{ config, pkgs, ... }:

let
  customPackages = import ../packages { inherit pkgs; };
in {
  home.packages = with pkgs; [
    cachix
    gpa
    haskellPackages.stylish-haskell
    htop
    magic-wormhole
    mosh
    nix-top
    nixops
    pandoc
    shellcheck
    sloccount
    unrar
    unzip
    zip
  ] ++ (pkgs.lib.mapAttrsToList (_: x: x) customPackages);

  home.file = {
    ".ghci".text = ''
      :set prompt "λ> "
    '';
    ".cabal/config".text = ''
      nix: True
    '';
  };

  manual.html.enable = true;

  programs = {
    bat.enable = true;
    command-not-found.enable = true;
    direnv.enable = true;
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    git = {
      enable = true;
      userName = "Jacek Galowicz";
      userEmail = "jacek@galowicz.de";
    };
    home-manager.enable = true;
  };
}
