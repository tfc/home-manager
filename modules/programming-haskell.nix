{ pkgs, ... }:

let
  customPackages = import ../packages { inherit pkgs; };
in {
  imports = [ ./programming.nix ];

  home.packages = with pkgs; [
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    hlint
  ] ++ (with customPackages; [
    tmux
    vim
  ]);

  home.file = {
    ".ghci".text = ''
      :set prompt "λ> "
    '';
    ".cabal/config".text = ''
      nix: True
    '';
  };
}
