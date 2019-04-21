{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs {}
}:

{
  tmux = pkgs.callPackage ./tmux {};
  neovim = pkgs.callPackage ./neovim {};
}
