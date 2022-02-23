{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/release-21.11;
    home-manager.url = github:rycee/home-manager/release-21.11;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    homeManagerConfigurations = {
      linux = let system = "x86_64-linux"; in
        home-manager.lib.homeManagerConfiguration {
          configuration = ./home.nix;
          inherit system;

          homeDirectory = "/home/tfc";
          username = "tfc";
        };
    };
  };
}
