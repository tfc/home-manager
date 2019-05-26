{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./textmedia.nix
  ];

  programs.bash = {
    sessionVariables = {
      # Need to test this out
      #SSH_AUTH_SOCK = "~/.gnupg/S.gpg-agent.ssh";
    };
    profileExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
  };
}
