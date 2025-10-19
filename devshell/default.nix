{ pkgs }:
{
  packages = with pkgs; [
    # Python toolchain
    python312
    python312Packages.pytest
    python312Packages.coverage
    ruff
    hatch
    uv
    bandit

    # Meta tools
    buck2

    # VCS/CLIs
    git
    gh
    sapling
    nodejs
  ];

  commands = [
    # Graphite CLI ("gt") from npm
    { name = "gt"; package = pkgs.nodePackages."@withgraphite/graphite-cli"; }

    # Install pyrefly via uv when needed
    { name = "pyrefly-install"; command = "uv tool install pyrefly"; }

    # language servers
    { name = "pyright"; package = pkgs.nodePackages.pyright; }
    { name = "bash-language-server"; package = pkgs.nodePackages.bash-language-server; }
    { name = "yaml-language-server"; package = pkgs.nodePackages.yaml-language-server; }
    { name = "vim-language-server"; package = pkgs.nodePackages.vim-language-server; }
  ];

  env = [
    { name = "STARSHIP_CONFIG"; value = "$PWD/.starship.toml"; }
  ];
}
