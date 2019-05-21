{ config, pkgs, ... }:

let
  customPackages = import ../packages { inherit pkgs; };

in {
  home.packages = with pkgs; [
    bashInteractive
    bash-completion
    gpa
    htop
    mosh
    nix-top
    pandoc
    shellcheck
    sloccount
    unrar
    unzip
    zip
  ] ++ (pkgs.lib.mapAttrsToList (_: x: x) customPackages);

  programs = {
    bash = {
      enable = true;
      sessionVariables = {
      };
      shellAliases = {
        ".." = "cd ..";
        ll = "ls -lsa";
        nrn = "nix repl '<nixpkgs>'";
        nrnc = "nix repl '<nixpkgs/nixos>'";
        nix-build-koma = "nix-build --option extra-substituters http://binary-cache.vpn.cyberus-technology.de --option trusted-public-keys cache.vpn.cyberus-technology.de:Snf50jUtTSHKmuv7Iz268zI9eCG8CYefCGpEq2Bt1P8= ";
      };
      profileExtra = ''
        export PS1="\[\033[38;5;6m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;10m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\] ";
      '';
    };
    bat.enable = true;
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
    home-manager.enable = true;
  };
}
