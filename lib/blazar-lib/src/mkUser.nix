{ lib }:
{ name, shell, extraGroups ? [ ], admin ? true }:
let wheel = if admin then [ "wheel" ] else [ ];
in {
  users.users.${name} = {
    isNormalUser = true;
    inherit shell;
    extraGroups = wheel ++ [ "networkmanager" "video" "audio" "input" ] ++ extraGroups;
  };
}
