{
  description = "kak-tree-sitter + helix = ❤";

  inputs = {
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    fenix,
    flake-utils,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [fenix.overlays.default];
      };

      helix = {
        version = "23.10-dev";
        repo = pkgs.fetchFromGitHub {
          owner = "helix-editor";
          repo = "helix";
          rev = "9b7dffbd613b3ba981890de78712ac0df520f145";
          hash = "sha256-j9h28WtYUswzsF/mwm7DJMxCPleloFrGUsnuysyE0OQ=";
        };
      };

      kak-tree-sitter = {
        rustPlatform,
        git,
      }:
        rustPlatform.buildRustPackage rec {
          version =
            (builtins.fromTOML (builtins.readFile
                "${src}/kak-tree-sitter/Cargo.toml"))
            .package
            .version;
          pname = "kak-tree-sitter";
          src = pkgs.fetchFromGitHub {
            owner = "hadronized";
            repo = "kak-tree-sitter";
            rev = "955b31df81532fc67a2e56279457d587f1d615fb";
            hash = "sha256-LuFI0tRtZZ9C6xKRUbSzE/oI8Z7djo7RvF5xM8776gI=";
          };
          cargoLock = {lockFile = "${src}/Cargo.lock";};
          # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
          cargoBuildFlags = ["--package=kak-tree-sitter"];
          nativeBuildInputs = [git];
        };
      kts-package = pkgs.callPackage kak-tree-sitter {};
      kts-grammars =
        pkgs.callPackage (import ./nix/gen-grammars.nix {inherit helix;})
        {};
      kts-config =
        pkgs.callPackage
        (import ./nix/gen-config.nix {inherit helix kts-grammars;}) {};
      kts-themes =
        pkgs.callPackage (import ./nix/gen-themes.nix {inherit helix;}) {};
    in {
      formatter = pkgs.alejandra;
      packages = {
        default = kts-package;
        config = kts-config;
        themes = kts-themes;
        grammars = kts-grammars;
      };
      apps.default = {
        type = "app";
        program = "${kts-package}/bin/kak-tree-sitter";
      };
      homeManagerModules.kak-tree-sitter-helix = {
        config,
        lib,
        ...
      }: {
        options.programs.kak-tree-sitter-helix.enable =
          lib.options.mkEnableOption "Enable kak-tree-sitter-helix";
        config = lib.mkIf config.programs.kak-tree-sitter-helix.enable {
          home.packages = [kts-package];
          xdg.configFile."kak-tree-sitter/config.toml".source = "${kts-config}/config.toml";
          xdg.configFile."kak/colors".source = "${kts-themes}/colors";
          xdg.dataFile."kak-tree-sitter/grammars".source = "${kts-grammars}/grammars";
          xdg.dataFile."kak-tree-sitter/queries".source = "${kts-grammars}/queries";
        };
      };
    });
}
