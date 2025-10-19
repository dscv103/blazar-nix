{
  description = "blazar-lib: helpers for NixOS & flakes";
  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { ... }: { };
      flake = {
        lib = import ./src {
          lib      = nixpkgs.lib;
          nixosLib = nixpkgs.lib;
        };
      };
    };
}
