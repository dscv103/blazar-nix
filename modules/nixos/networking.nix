{ ... }: {
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  services.timesyncd.enable = true;
}
