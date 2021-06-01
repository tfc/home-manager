{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:rycee/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "/nixpkgs";
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
