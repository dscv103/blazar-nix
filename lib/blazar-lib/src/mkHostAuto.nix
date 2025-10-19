{ lib, nixosLib }:
{ inputs
, system ? "x86_64-linux"
, hostsDir ? ./../../../hosts
}:
let
  hostNames =
    lib.filter (n: builtins.pathExists (hostsDir + "/${n}/default.nix"))
               (builtins.attrNames (builtins.readDir hostsDir));
  mkHost = name: nixosLib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [ (hostsDir + "/${name}/default.nix") ];
  };
in lib.genAttrs hostNames mkHost
