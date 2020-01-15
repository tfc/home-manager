{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  manual.html.enable = true;

  programs.  firefox = {
    enable = true;
    extensions = [];
  };
}
