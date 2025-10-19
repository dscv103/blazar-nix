{ lib, config, ... }:
let enable = config.blazar.features.dev.enable;
in {
  config = lib.mkIf enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
