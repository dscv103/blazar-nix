{ lib }:
path: config: body: lib.mkIf (lib.getAttrFromPath path config) body
