{ pkgs, ... }:
{
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc.automatic = true;
    gc.dates = "weekly";
  };

  xdg.portal.enable = true;
  programs.nix-ld.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "CascadiaCode" ]; })
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  environment.systemPackages = with pkgs; [
    curl wget rsync openssh
    unzip zip xz zstd tree which file
    jq yq-go ripgrep fd eza bat fzf
    btop htop fastfetch
    lshw pciutils usbutils lm_sensors
    wl-clipboard wlr-randr kanshi brightnessctl grim slurp swappy
    rofi-wayland waybar
    zed-editor vscode ghostty
    git gh sapling
    sops age
    neovim
    starship
  ];
}
