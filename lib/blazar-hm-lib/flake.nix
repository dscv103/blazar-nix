{
  description = "blazar-hm-lib: helpers for Home Manager";
  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { ... }: { };
      flake.lib.hm = import ./src { lib = nixpkgs.lib; };
    };
}
