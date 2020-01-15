{ ... }:
{
  imports = [ ./spotifyd-definition.nix ];

  services.spotifyd = {
    enable = true;
    settings =  {
      global = {
        username = "jacek.galowicz@gmail.com";
        password = "E5S37HCC";
        device_name = "jongepad";
        backend = "pulseaudio";
      };
    };
  };
}
