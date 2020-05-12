{ pkgs, ... }:

let
  customPackages = with import ../packages { inherit pkgs; }; [
    neovim
    tmux
  ];
  collectOld = pkgs.writeScriptBin "nix-collect-old" ''
    nix-env --delete-generations old
    nix-collect-garbage
    nix-collect-garbage -d
    nix-store --gc --print-dead
    nix-store --optimize
  '';
in {
  home.packages = with pkgs; [
    collectOld
    direnv
    killall
    magic-wormhole
    mosh
    nix-top
    nixops
    unrar
    unzip
    zip
  ] ++ customPackages;

  programs = {
    bat.enable = true;
    command-not-found.enable = true;
    htop = {
      enable = true;
      colorScheme = 6;
      cpuCountFromZero = true;
      highlightBaseName = true;
      highlightMegabytes = true;
      highlightThreads = true;
      meters = {
        left =  [
          "AllCPUs2"
          "Memory"
          "Swap"
          { kind = "Battery"; mode = 1; }
        ];
        right = [
          "Hostname"
          "Tasks"
          "LoadAverage"
          "Uptime"
          { kind = "CPU"; mode = 3; }
        ];
      };
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    man.enable = true;
  };
}
