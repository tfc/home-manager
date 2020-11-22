{ pkgs, ... }:

let
  inherit (import ../packages { inherit pkgs; }) sync_repos;

  repos = {
    "overlays/cbspkgs" = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/cbspkgs.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:infrastructure/cbspkgs.git";
    };
    "overlays/cbspkgs-public" = {
      origin = "git@github.com:cyberus-technology/cbspkgs-public.git";
      upstream = "git@github.com:tfc/cbspkgs-public.git";
    };
    sotest = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/sotest.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:sotest/sotest.git";
    };
    supernova-core = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/supernova-core.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:supernova-core/supernova-core.git";
    };
    nixpkgs = {
      origin = "git@github.com:NixOS/nixpkgs.git";
      upstream = "git@github.com:tfc/nixpkgs.git";
    };
  };
  reposFile = pkgs.writeText "repos.json" (builtins.toJSON repos);

  repo_sync_fixed = pkgs.writeScriptBin "sync_repos" ''
    ${sync_repos}/bin/sync_repos -C /home/tfc/src < ${reposFile}
  '';
in {
  home.packages = with pkgs; [
    jq
    niv
    nix-linter
    nixpkgs-fmt
    repo_sync_fixed
    shellcheck
    sloccount
  ];

  programs.git = {
    enable = true;
    userName = "Jacek Galowicz";
    userEmail = "jacek@galowicz.de";
  };

  programs.direnv.enable = true;
  services.lorri.enable = true;
}
