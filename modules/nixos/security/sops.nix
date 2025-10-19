{ lib, config, ... }:
let enable = config.blazar.features.secrets.sops.enable;
in {
  config = lib.mkIf enable {
    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      age.keyFile = "/var/lib/sops-nix/key.txt";
      secrets."example.env" = { owner = "dscv"; path = "/run/secrets/example.env"; };
    };
  };
}
