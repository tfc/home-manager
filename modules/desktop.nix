{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    signal-desktop
  ];

  manual.html.enable = true;

  programs.  firefox = {
    enable = true;
    extensions = [];
  };
}
