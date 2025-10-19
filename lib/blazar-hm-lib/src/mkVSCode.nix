{ lib }:
{ extensions ? [ ], settings ? { } }:
{
  programs.vscode = {
    enable = true;
    userSettings = settings;
    extensions = extensions;
  };
}
