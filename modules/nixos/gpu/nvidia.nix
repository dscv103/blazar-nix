{ lib, config, pkgs, ... }:
let enable = config.blazar.features.gpu.nvidia.enable;
in {
  config = lib.mkIf enable {
    hardware.opengl.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    environment.sessionVariables.GBM_BACKEND = "nvidia-drm";
  };
}
