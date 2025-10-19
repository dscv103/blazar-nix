{ lib }:
{
  mkHMUser = import ./mkHMUser.nix { inherit lib; };
  mkVSCode = import ./mkVSCode.nix { inherit lib; };
}
