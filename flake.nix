{
  description = "blazar: defensive, modular NixOS with library flakes";

  inputs = {
    nixpkgs.url       = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url   = "github:hercules-ci/flake-parts";
    devshell.url      = "github:numtide/devshell";

    # External modules
    home-manager.url  = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url      = "github:Mic92/sops-nix";
    disko.url         = "github:nix-community/disko";
    niri.url          = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    # Library flakes (local)
    blazar-lib.url    = "path:./lib/blazar-lib";
    blazar-hm-lib.url = "path:./lib/blazar-hm-lib";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, devshell, blazar-lib, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        devshell.flakeModule
        ./ci/checks.nix
      ];

      perSystem = { system, ... }: {
        _module.args.pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
        devshells.default = import ./devshell/default.nix;
      };

      flake = {
        nixosConfigurations = blazar-lib.lib.mkHostAuto {
          inherit inputs;
          hostsDir = ./hosts;
        };
      };
    };
}
