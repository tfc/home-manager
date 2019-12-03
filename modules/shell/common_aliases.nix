{
  ".." = "cd ..";
  ll = "ls -lsa";
  nrn = "nix repl '<nixpkgs>'";
  nrnc = "nix repl '<nixpkgs/nixos>'";
  nix-build-koma = "nix-build --option extra-substituters http://binary-cache.vpn.cyberus-technology.de --option trusted-public-keys cache.vpn.cyberus-technology.de:Snf50jUtTSHKmuv7Iz268zI9eCG8CYefCGpEq2Bt1P8= ";
  nix-update = "sudo nix-channel --update && nix-channel --update && sudo nixos-rebuild switch && home-manager switch";
}
