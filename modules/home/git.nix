{ ... }:
{
  programs.git = {
    enable = true;
    userName = "dscv";
    userEmail = "example@example.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
  programs.gh.enable = true;
}
