{
  description = "kak-tree-sitter + helix = ❤";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nix-github-actions = {
      url = "github:nix-community/nix-github-actions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        version = "25.01.1";
        repo = pkgs.fetchFromGitHub {
          owner = "helix-editor";
          repo = "helix";
          rev = version;
          hash = "sha256-wGfX2YcD9Hyqi7sQ8FSqUbN8/Rhftp01YyHoTWYPL8U=";
        };
      };

      kak-tree-sitter-unwrapped =
        pkgs.callPackage
        ./nix/kak-tree-sitter-package.nix {};

      kak-tree-sitter-grammars =
        pkgs.callPackage
        (import ./nix/gen-grammars.nix {inherit helix;}) {};

      kak-tree-sitter-config =
        pkgs.callPackage
        (import ./nix/gen-config.nix {inherit helix kak-tree-sitter-grammars;}) {};

      kak-tree-sitter-themes =
        pkgs.callPackage
        (import ./nix/gen-themes.nix {inherit helix;}) {};

      kak-tree-sitter-derivation = {
        kak-tree-sitter-config,
        kak-tree-sitter-grammars,
        kak-tree-sitter-unwrapped,
        makeWrapper,
        stdenv,
      }:
        stdenv.mkDerivation {
          pname = "kak-tree-sitter-helix";
          version = kak-tree-sitter-unwrapped.version;
          nativeBuildInputs = [
            # Listing dependencies to make it easier for `nix bundle` to get a closure
            # NOTE: May not be needed
            kak-tree-sitter-config
            kak-tree-sitter-grammars
            kak-tree-sitter-unwrapped
            makeWrapper
          ];
          # A trick to avoid erroring out due to empty `src`
          unpackPhase = "true";
          buildPhase = ''
            # kak-tree-sitter expects certain directory structure to find config, grammars and queries
            mkdir -p $out/bin
            mkdir -p $out/config/kak-tree-sitter
            mkdir -p $out/share/kak-tree-sitter/
            mkdir -p $out/share/kak-tree-sitter/

            cp             ${kak-tree-sitter-config}/config.toml $out/config/kak-tree-sitter/config.toml
            cp --recursive ${kak-tree-sitter-grammars}/grammars $out/share/kak-tree-sitter/
            cp --recursive ${kak-tree-sitter-grammars}/queries $out/share/kak-tree-sitter/

            # Wrapping the normal kak-tree-sitter binary pointing it to the generated config, grammars and queries
            makeWrapper ${kak-tree-sitter-unwrapped}/bin/kak-tree-sitter $out/bin/kak-tree-sitter \
              --set XDG_DATA_HOME "$out/share" \
              --set XDG_CONFIG_HOME "$out/config"
          '';

          meta.mainProgram = "kak-tree-sitter";
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
          xdg.configFile."kak/colors/kak-tree-sitter-helix".source = "${kak-tree-sitter-themes}/colors";
        };
      };

      nixosModules.kak-tree-sitter-helix = {
        config,
        lib,
        ...
      }: let
        cfg = config.programs.kak-tree-sitter-helix;
      in {
        options.programs.kak-tree-sitter-helix = {
          enable =
            lib.options.mkEnableOption "Enable kak-tree-sitter-helix";

          user = lib.mkOption {
            type = lib.types.str;
            description = "Username for whom to link Kakoune themes from the nix store using systemd user-level tmpfiles";
          };
        };

        config = lib.mkIf cfg.enable {
          environment.systemPackages = [kak-tree-sitter];
          systemd.user.tmpfiles.users.${cfg.user}.rules = [
            "L+ /home/${cfg.user}/.config/kak/colors/kak-tree-sitter-helix 0444 - - - ${kak-tree-sitter-themes}/colors"
          ];
        };
      };
    });
}
