# blazar-nixos

A defensive, modular NixOS flake with Wayland+niri, NVIDIA GTX 970, devshell, sops-nix, and disko (bcachefs).

## Build blazar

```bash
sudo nixos-rebuild switch --flake .#blazar
```

## Checks (CI/local)

```bash
nix flake check
```

## Layout

- `flake.nix` – tiny; hosts auto-discovered; devshell + CI checks via flake-parts.
- `hosts/blazar` – host config + feature flags.
- `modules/nixos` – NixOS modules (feature-gated).
- `modules/home` – Home-Manager modules.
- `storage` – Disko plan(s).
- `lib/blazar-lib` – generic library helpers.
- `lib/blazar-hm-lib` – Home-Manager helpers.
- `devshell` – Python-first dev shell w/ gt, buck2, etc.
- `ci/checks.nix` – builds NixOS hosts on `flake check`.

## Feature flags

Set in `hosts/<host>/default.nix` under `blazar.features.*`.
