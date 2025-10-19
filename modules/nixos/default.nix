{ lib, inputs, ... }:
{
  imports =
    [
      ./options.nix
      ./base.nix
      ./dev.nix
      ./networking.nix
      ./audio-pipewire.nix
      ./desktop
      ./gpu
      ./hardware
      ./security
    ]
    ++ lib.optional (inputs?home-manager) inputs.home-manager.nixosModules.home-manager
    ++ lib.optional (inputs?sops-nix)     inputs.sops-nix.nixosModules.sops
    ++ lib.optional (inputs?disko)        inputs.disko.nixosModules.disko
    ++ lib.optional (inputs?niri)         inputs.niri.nixosModules.niri;
}
