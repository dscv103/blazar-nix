{ inputs, pkgs, lib, ... }:
inputs.blazar-lib.lib.mkUser { name = "dscv"; shell = pkgs.zsh; admin = true; }
