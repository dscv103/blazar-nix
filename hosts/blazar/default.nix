{ inputs, pkgs, lib, ... }:
let
  bzhm  = inputs.blazar-hm-lib.lib.hm;
in
{
  networking.hostName = "blazar";
  time.timeZone = "America/Chicago";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ./users.nix
    ../../modules/nixos
    ../../modules/home
    ../../storage

    # External modules
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
    inputs.disko.nixosModules.disko
    inputs.niri.nixosModules.niri

    # Home-Manager user via helper
    (bzhm.mkHMUser {
      name = "dscv";
      imports = [ ../../modules/home ];
    })
  ];

  # Feature flags per-host
  blazar.features = {
    desktop.niri.enable     = true;
    gpu.nvidia.enable       = true;   # GTX 970 (Maxwell)
    hardware.amd.enable     = true;
    dev.enable              = true;
    editors.enable          = true;
    secrets.sops.enable     = true;
    storage.bcachefs.enable = true;
  };
}
