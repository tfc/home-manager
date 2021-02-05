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
    thunderbird-bin
    xournal
  ];

  manual.html.enable = true;

  programs.firefox = {
    enable = true;
    extensions = [];
    enableGnomeExtensions = true;
    package = pkgs.firefox-bin;
    profiles = {
      myprofile = {
        settings = {
          "browser.sessionstore.interval" = 60000;
          "browser.tabs.animate" = false;
          "browser.download.animateNotifications" = false;
          "browser.urlbar.maxRichResults" = 5;
          "dom.battery.enabled" = false;
          "extensions.pocket.enabled" = false;
          "general.smoothScroll" = false;
          "network.prefetch-next" = false;
          "privacy.trackingprotection.enabled" = true;
          "toolkit.cosmeticAnimations.enabled" = false;

          # performance suggestions from https://gist.github.com/0XDE57/fbd302cef7693e62c769
          "layout.frame_rate.precise" = true;
          "webgl.force-enabled" = true;
          "layers.acceleration.force-enabled" = true;
          "layers.offmainthreadcomposition.enabled" = true;
          "layers.offmainthreadcomposition.async-animations" = true;
          "layers.async-video.enabled" = true;
          "html5.offmainthread" = true;
        };
      };
    };
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
