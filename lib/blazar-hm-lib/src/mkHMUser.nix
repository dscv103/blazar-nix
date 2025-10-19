{ lib }:
{ name, imports ? [ ], extra ? { } }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${name} = { inherit imports; } // extra;
}
