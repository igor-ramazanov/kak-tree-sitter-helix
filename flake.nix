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

      helix = rec {
        version = "24.07";
        repo = pkgs.fetchFromGitHub {
          owner = "helix-editor";
          repo = "helix";
          rev = version;
          hash = "sha256-lKsjgqQAh1Pfo57T9N29YOsbJp/Fl5tOTxV5Fn4xFLg=";
        };
      };

      kak-tree-sitter-unwrapped = pkgs.callPackage ({
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
          patches = [./kts.patch];
          cargoLock = {lockFile = "${src}/Cargo.lock";};
          # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
          cargoBuildFlags = ["--package=kak-tree-sitter"];
          nativeBuildInputs = [git];
        }) {};

      kak-tree-sitter-grammars =
        pkgs.callPackage (import ./nix/gen-grammars.nix {inherit helix;})
        {};

      kak-tree-sitter-config =
        pkgs.callPackage
        (import ./nix/gen-config.nix {inherit helix kak-tree-sitter-grammars;}) {};

      kak-tree-sitter-themes =
        pkgs.callPackage (import ./nix/gen-themes.nix {inherit helix;}) {};

      kak-tree-sitter-derivation = {
        kak-tree-sitter-config,
        kak-tree-sitter-grammars,
        kak-tree-sitter-unwrapped,
        makeWrapper,
        symlinkJoin,
      }:
        symlinkJoin {
          name = "kak-tree-sitter";
          nativeBuildInputs = [makeWrapper];
          paths = [
            kak-tree-sitter-config
            kak-tree-sitter-grammars
            kak-tree-sitter-unwrapped
          ];

          postBuild = ''
            mkdir -p $out/bin
            mkdir -p $out/config/kak-tree-sitter
            mkdir -p $out/share/kak-tree-sitter/grammars
            mkdir -p $out/share/kak-tree-sitter/queries

            rm -rf $out/bin/kak-tree-sitter
            rm -rf $out/config.toml
            rm -rf $out/grammars
            rm -rf $out/queries

            ln -s ${kak-tree-sitter-config}/config.toml $out/config/kak-tree-sitter/config.toml
            ln -s ${kak-tree-sitter-grammars}/grammars $out/share/kak-tree-sitter/grammars
            ln -s ${kak-tree-sitter-grammars}/queries $out/share/kak-tree-sitter/queries

            makeWrapper ${kak-tree-sitter-unwrapped}/bin/kak-tree-sitter $out/bin/kak-tree-sitter \
              --set XDG_DATA_HOME "$out/share" \
              --set XDG_CONFIG_HOME "$out/config"
          '';
        };

      kak-tree-sitter = pkgs.callPackage kak-tree-sitter-derivation {
        inherit
          kak-tree-sitter-config
          kak-tree-sitter-grammars
          kak-tree-sitter-unwrapped
          ;
      };
    in {
      formatter = pkgs.alejandra;
      packages = {
        default = kak-tree-sitter;
        themes = kak-tree-sitter-themes;
      };
      apps.default = {
        type = "app";
        program = "${kak-tree-sitter}/bin/kak-tree-sitter";
      };
      homeManagerModules.kak-tree-sitter-helix = {
        config,
        lib,
        ...
      }: {
        options.programs.kak-tree-sitter-helix.enable =
          lib.options.mkEnableOption "Enable kak-tree-sitter-helix";
        config = lib.mkIf config.programs.kak-tree-sitter-helix.enable {
          home.packages = [kak-tree-sitter];
          xdg.configFile."kak/colors".source = "${kak-tree-sitter-themes}/colors";
        };
      };
    });
}
