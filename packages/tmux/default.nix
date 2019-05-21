# Tmux with ./tmux.conf baked in
{ tmux, tmuxPlugins, writeText, symlinkJoin, makeWrapper }:
let
  tmuxConf = (with tmuxPlugins; ''
    run-shell ${resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
    run-shell ${continuum}/share/tmux-plugins/continuum/continuum.tmux
  '') + builtins.readFile ./tmux.conf  ;
in symlinkJoin {
  name = "tmux";
  buildInputs = [makeWrapper];
  paths = [ tmux ];
  postBuild = ''
    wrapProgram "$out/bin/tmux" \
    --add-flags "-f ${writeText "tmux.conf" tmuxConf}"
  '';
}
