{ pkgs, ... }:

{
  imports = [ ./desktop.nix ];

  programs.gnome-terminal = {
    enable = true;
    themeVariant = "dark";
    showMenubar = false;
    profile.default = {
      default = true;
      visibleName = "Default";
    };
  };
}
