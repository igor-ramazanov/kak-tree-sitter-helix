{
  description = "kak-tree-sitter + helix = ❤";

  inputs = {
    devshell.url = "github:numtide/devshell";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    devshell,
    fenix,
    flake-utils,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [devshell.overlays.default fenix.overlays.default];
      };

      helix = {
        version = "23.10-dev";
        repo = pkgs.fetchFromGitHub {
          owner = "helix-editor";
          repo = "helix";
          rev = "85fce2f5b6c9f35ab9d3361f3933288a28db83d4";
          hash = "sha256-TNEsdsaCG1+PvGINrV/zw7emzwpfWiml4b77l2n5UEI=";
        };
      };

      kak-tree-sitter = {
        rustPlatform,
        git,
      }:
        rustPlatform.buildRustPackage rec {
          version = (builtins.fromTOML (builtins.readFile "${src}/kak-tree-sitter/Cargo.toml")).package.version;
          pname = "kak-tree-sitter";
          src = pkgs.fetchFromGitHub {
            owner = "hadronized";
            repo = "kak-tree-sitter";
            rev = "9fccddd14b66a63c2c93d4069fee6a51155e5a9e";
            hash = "sha256-0xF0i+f1s5wdW/GfeuudaVSlSx74y5zLOV/5rP0UD8E=";
          };
          cargoLock = {
            lockFile = "${src}/Cargo.lock";
          };
          # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
          cargoBuildFlags = ["--package=kak-tree-sitter"];
          nativeBuildInputs = [git];
        };
      kts-package = pkgs.callPackage kak-tree-sitter {};
      kts-config = pkgs.callPackage (import ./gen-config.nix {inherit helix;}) {};
      kts-grammars = pkgs.callPackage (import ./gen-grammars.nix {inherit helix;}) {};
    in {
      formatter = pkgs.alejandra;
      packages.default = kts-package;
      apps.default = {
        type = "app";
        program = "${kts-package}/bin/kak-tree-sitter";
      };
      devShell = pkgs.devshell.mkShell {
        name = "kak-tree-sitter-helix";
        motd = "Entered the kak-tree-sitter-helix development environment";
        packages = let
          rust = [(pkgs.fenix.stable.withComponents ["cargo" "clippy" "rust-analyzer" "rustfmt" "rust-src"])];
          python = [(pkgs.python311.withPackages (p: [p.flake8 p.python-lsp-server p.python-lsp-black]))];
        in
          rust ++ python;
      };
      homeManagerModules.kak-tree-sitter-helix = {
        config,
        lib,
        ...
      }: {
        options.programs.kak-tree-sitter-helix.enable = lib.options.mkEnableOption "Enable kak-tree-sitter-helix";
        config = lib.mkIf config.programs.kak-tree-sitter-helix.enable {
          home.packages = [kts-package];
          xdg.configFile."kak-tree-sitter/config.toml".source = "${kts-config}/config.toml";
          xdg.dataFile."kak-tree-sitter/grammars".source = "${kts-grammars}/grammars";
          xdg.dataFile."kak-tree-sitter/queries".source = "${kts-grammars}/queries";
        };
      };
    });
}
