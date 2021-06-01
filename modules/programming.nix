{ pkgs, ... }:

let
  inherit (import ../packages { inherit pkgs; }) sync_repos;

  repos = let
    folderPrefix = prefix: pkgs.lib.mapAttrs' (name: value: pkgs.lib.nameValuePair (prefix + name) value);
  in folderPrefix "overlays/" {
    "cbspkgs" = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/cbspkgs.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:infrastructure/cbspkgs.git";
    };
    "cbspkgs-public" = {
      origin = "git@github.com:cyberus-technology/cbspkgs-public.git";
      upstream = "git@github.com:tfc/cbspkgs-public.git";
    };
    "nova" = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/NOVA.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:supernova-core/NOVA.git";
    };
    "supernova" = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/supernova-core.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:supernova-core/supernova-core.git";
    };
    "virtualbox" = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/virtualbox.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:open-source/virtualbox.git";
      martin = "git@gitlab.vpn.cyberus-technology.de:mmesser/virtualbox.git";
    };
    slvm = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/supernova-virt-kmod.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:supernova-core/supernova-virt-kmod.git";
    };
  } // {
    cyberus-blog = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/cyberus_blog.git";
      smanns = "git@gitlab.vpn.cyberus-technology.de:smanns/cyberus_blog.git";
      julian = "git@gitlab.vpn.cyberus-technology.de:jstecklina/cyberus_blog.git";
      philipp = "git@gitlab.vpn.cyberus-technology.de:pbarthel/cyberus_blog.git";
    };
    sotest = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/sotest.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:sotest/sotest.git";
      lucas = "git@gitlab.vpn.cyberus-technology.de:lucas.baschinski/sotest_original";
      markus = "git@gitlab.vpn.cyberus-technology.de:mnapierkowski/sotest.git";
    };
    supernova-core = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/supernova-core.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:supernova-core/supernova-core.git";
    };
    nixpkgs = {
      origin = "git@github.com:NixOS/nixpkgs.git";
      upstream = "git@github.com:tfc/nixpkgs.git";
    };
    mmt = {
      origin = "git@gitlab.vpn.cyberus-technology.de:jacek/multi-monitor-project.git";
      upstream = "git@gitlab.vpn.cyberus-technology.de:sotest/secunet-code/multi-monitor-project.git";
    };
  };
  reposFile = pkgs.writeText "repos.json" (builtins.toJSON repos);

  repo_sync_fixed = pkgs.writeScriptBin "sync_repos" ''
    ${sync_repos}/bin/sync_repos -C /home/tfc/src < ${reposFile}
  '';
in {
  home.packages = with pkgs; [
    gti
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
    lfs.enable = true;
    delta.enable = true;
  };

  programs.direnv.enable = true;
  services.lorri.enable = true;
}
