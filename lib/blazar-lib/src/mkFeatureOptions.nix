{ lib }:
features:
  lib.foldl' (acc: f:
    acc // lib.setAttrByPath f.path (lib.mkEnableOption f.desc)
  ) { } features
