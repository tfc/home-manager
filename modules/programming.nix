{ pkgs, ... }:

{
  home.packages = with pkgs; [
    arion
    cachix
    gh
    gti
    jq
    niv
    nix-diff
    nix-linter
    nixpkgs-fmt
    shellcheck
    sloccount
    yq
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
