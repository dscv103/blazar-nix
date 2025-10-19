{ lib, nixosLib }:
let
  importTree       = import ./importTree.nix { inherit lib; };
  mkHostAuto       = import ./mkHostAuto.nix { inherit lib nixosLib; };
  mkFeatureOptions = import ./mkFeatureOptions.nix { inherit lib; };
  mkIfEnabled      = import ./mkIfEnabled.nix { inherit lib; };
  mkUser           = import ./mkUser.nix { inherit lib; };
in {
  inherit importTree mkHostAuto mkFeatureOptions mkIfEnabled mkUser;

  optionalInputModule = inputsAttr: fieldPath:
    name:
      if inputsAttr ? ${name} then [ (builtins.getAttr name inputsAttr).${fieldPath} ] else [];
  importIfExists = p: lib.optional (builtins.pathExists p) p;
}
