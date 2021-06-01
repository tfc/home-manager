{ pkgs, config, ... }:

let
  customPackages = with import ../packages { inherit pkgs; }; [
    neovim
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
    gtop
    killall
    magic-wormhole
    mosh
    nix-top
    nixops
    pstree
    qemu
    unrar
    unzip
    zip
  ] ++ customPackages;

  programs = {
    bat.enable = true;
    command-not-found.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableNixDirenvIntegration = true;
    };
    dircolors = {
      enable = true;
      enableBashIntegration = true;
    };
    htop = {
      enable = true;
      settings = {
        color_scheme = 6;
        cpu_count_from_zero = true;
        highlight_base_name = true;
        highlight_megabytes = true;
        highlight_threads = true;
      } // (with config.lib.htop; leftMeters {
        AllCPUs2 = modes.Bar;
        Memory = modes.Bar;
        Swap = modes.Bar;
        Battery = modes.Bar;
      }) // (with config.lib.htop; rightMeters {
        Tasks = modes.Text;
        LoadAverage = modes.Text;
        Uptime = modes.Text;
        CPU = modes.Graph;
      });
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    man.enable = true;
    tmux = {
      aggressiveResize = true;
      clock24 = true;
      enable = true;
      historyLimit = 5000;
      keyMode = "vi";
      newSession = true;
      sensibleOnTop = true;
      extraConfig = ''
        set -sg escape-time 0
        set -g mouse on

        set -g status-left ""
        set -g status-right '#[fg=colour233,bg=colour241,bold] %d.%m. #[fg=colour233,bg=colour245,bold] %H:%M:%S '
        set -g status-right-length 50
        set -g status-left-length 20
      '';
      plugins = with pkgs.tmuxPlugins; [
        tmux-colors-solarized
        vim-tmux-navigator
      ];
    };
  };
}
