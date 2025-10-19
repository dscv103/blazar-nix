{ lib, config, pkgs, ... }:
let enable = config.blazar.features.editors.enable;
in lib.mkIf enable {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      esbenp.prettier-vscode
      github.vscode-pull-request-github
      ms-vscode.makefile-tools
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "python.analysis.typeCheckingMode" = "basic";
      "python.defaultInterpreterPath" = "python3";
    };
  };

  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    telemetry = "off";
    ui_font_size = 14;
    tab_size = 2;
  };
}
