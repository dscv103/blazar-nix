{ lib, config, ... }:
{
  imports = [ ./disko-bcachefs.nix ];
  config = lib.mkIf (!config.blazar.features.storage.bcachefs.enable) { disko.devices = {}; };
}
