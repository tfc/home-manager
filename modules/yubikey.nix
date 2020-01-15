{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gpa
  ];

  programs.bash.bashrcExtra = ''
    SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  '';

  programs.zsh.sessionVariables = {
    SSH_AUTH_SOCK = "~/.gnupg/S.gpg-agent.ssh";
  };
} // lib.optionalAttrs (builtins.currentSystem == "x86_64-linux") {
  services = {
    gnome-keyring.components = [ "pkcs11" "secrets" ]; # no SSH
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };
}
