{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      height = 28;
      modules-left = [ "clock" "cpu" "memory" ];
      modules-right = [ "tray" ];
    };
    style = ''
      * { font-family: "JetBrainsMono Nerd Font", monospace; }
    '';
  };

  programs.ghostty = {
    enable = true;
    settings = { window-decoration = "none"; };
  };

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "drun,run,ssh";
      display-drun: "Apps";
      font: "JetBrainsMono Nerd Font 12";
    }
  '';
}
