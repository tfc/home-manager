{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    deja-dup
    gimp
    gnome3.cheese
    gnome3.eog
    gnome3.evince
    gnome3.gnome-tweak-tool
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    inkscape
    libreoffice
    mattermost-desktop
    element-desktop
    signal-desktop
    skypeforlinux
    spotify
    thunderbird-78
  ];

  manual.html.enable = true;

  programs.firefox = {
    enable = true;
    extensions = [];
    enableGnomeExtensions = true;
    package = pkgs.firefox-bin;
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "cfhdojbkjhnklbpkdaibdccddilifddb" # adblock plus
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
      "hdokiejnpimakedhajhdlcegeplioahd" # lastpass
    ];
  };
}
