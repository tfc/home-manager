{ ... }:

{
  programs.bash = {
    profileExtra = ''
        export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    '';
}
