{ lib, config, ... }:
let enable = config.blazar.features.hardware.amd.enable;
in { config = lib.mkIf enable { hardware.cpu.amd.updateMicrocode = true; }; }
