{ lib, config, inputs, pkgs, ... }:
let enable = config.blazar.features.desktop.niri.enable;
in
{
  config = lib.mkIf enable {
    services.xserver.enable = false;
    programs.waybar.enable = true;
    programs.niri.enable = true;

    # Optional overlay for faster niri updates
    nixpkgs.overlays = lib.optional (inputs?niri) inputs.niri.overlays.niri;
    # programs.niri.package = pkgs.niri-unstable;

    environment.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL     = "1";
      GBM_BACKEND        = "nvidia-drm";
    };
  };
}
