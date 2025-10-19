{ lib, config, ... }:
let enable = config.blazar.features.desktop.niri.enable;
in {
  config = lib.mkIf enable {
    services.greetd.enable = true;
    programs.regreet.enable = true;
  };
}
