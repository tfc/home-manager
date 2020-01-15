{ pkgs, ... }:

let
  customPackages = with import ../packages { inherit pkgs; }; [
    neovim
    tmux
  ];
in {
  home.packages = with pkgs; [
    magic-wormhole
    mosh
    nix-top
    nixops
    unrar
    unzip
    zip
  ];

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
  };
}
