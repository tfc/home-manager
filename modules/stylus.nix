{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alchemy
    drawpile
    gnomeExtensions.draw-on-your-screen
    write_stylus
  ];
}
