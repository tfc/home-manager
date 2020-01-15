{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
