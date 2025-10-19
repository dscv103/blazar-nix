{ lib, config, inputs, ... }:
let
  flags = inputs.blazar-lib.lib.mkFeatureOptions [
    { path = [ "blazar" "features" "dev" "enable" ];               desc = "Developer stack (direnv, devshell)"; }
    { path = [ "blazar" "features" "editors" "enable" ];           desc = "Editors (Zed, VS Code official)"; }
    { path = [ "blazar" "features" "secrets" "sops" "enable" ];    desc = "sops-nix secrets"; }
    { path = [ "blazar" "features" "storage" "bcachefs" "enable" ];desc = "Disko plan with bcachefs root"; }
    { path = [ "blazar" "features" "desktop" "niri" "enable" ];    desc = "Niri Wayland desktop"; }
    { path = [ "blazar" "features" "gpu" "nvidia" "enable" ];      desc = "NVIDIA proprietary driver"; }
    { path = [ "blazar" "features" "hardware" "amd" "enable" ];    desc = "AMD CPU microcode"; }
  ];
in {
  options = flags;

  assertions = [
    { assertion = (!config.blazar.features.desktop.niri.enable) || (!config.services.xserver.enable);
      message   = "Niri is Wayland-only: set services.xserver.enable = false."; }
  ];
  warnings = lib.optional (config.blazar.features.gpu.nvidia.enable && config.blazar.features.desktop.niri.enable)
    "NVIDIA + Wayland requires GBM + Ozone env; this profile sets them for you.";
}
