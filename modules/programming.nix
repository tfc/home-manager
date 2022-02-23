{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gti
    jq
    niv
    nix-linter
    nixpkgs-fmt
    shellcheck
    sloccount
  ];

  programs.git = {
    enable = true;
    userName = "Jacek Galowicz";
    userEmail = "jacek@galowicz.de";
    lfs.enable = true;
    delta.enable = true;
  };

  programs.direnv.enable = true;
}
