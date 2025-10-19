{ ... }:
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1"; # ← adjust
      content = {
        type = "gpt";
        partitions = {
          esp = {
            name = "ESP"; type = "EF00"; size = "1G";
            content = { type = "filesystem"; format = "vfat"; mountpoint = "/boot"; mountOptions = [ "umask=0077" ]; };
          };
          root = {
            name = "root"; size = "100%";
            content = { type = "filesystem"; format = "bcachefs"; mountpoint = "/"; mountOptions = [ "compress=zstd" ]; };
          };
        };
      };
    };
  };
}
