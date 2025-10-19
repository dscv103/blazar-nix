{ lib }:
let
  recImport = dir:
    let
      entries = builtins.readDir dir;
      names   = builtins.attrNames entries;
      files   = builtins.filter (n: entries.${n} == "regular" && lib.hasSuffix ".nix" n && n != "default.nix") names;
      dirs    = builtins.filter (n: entries.${n} == "directory") names;
    in
      (map (n: dir + "/${n}") files)
      ++ lib.concatMap (n: recImport (dir + "/${n}")) dirs;
in dir: recImport dir
