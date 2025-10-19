{ pkgs, ... }:
{
  home.username = "dscv";
  home.homeDirectory = "/home/dscv";
  home.stateVersion = "24.11";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(direnv hook zsh)"
      export EDITOR=vim
    '';
  };

  programs.starship.enable = true;

  home.packages = with pkgs; [
    zoxide
    delta
  ];
}
