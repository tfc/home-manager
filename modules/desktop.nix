{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    gimp
    gnome3.evolution
    inkscape
    riot-desktop
    signal-desktop
  ];

  manual.html.enable = true;

  programs.firefox = {
    enable = true;
    extensions = [];
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "cfhdojbkjhnklbpkdaibdccddilifddb" # adblock plus
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "hdokiejnpimakedhajhdlcegeplioahd" # lastpass
    ];
  };
}
