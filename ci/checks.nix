{ lib, self, ... }:
{
  # Build all NixOS hosts during `nix flake check`.
  flake.checks."x86_64-linux" =
    lib.mapAttrs (_host: conf: conf.config.system.build.toplevel)
      self.nixosConfigurations;
}
