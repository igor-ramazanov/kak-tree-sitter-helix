{
  description = "kak-tree-sitter + helix = ❤";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nix-github-actions = {
      url = "github:nix-community/nix-github-actions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      flake-utils,
      nixpkgs,
      ...
    }:
    let
      mkHelix =
        { pkgs, ... }:
        rec {
          version = "ba40e547426b0f9896c8bdc699a4ab11f2b37dbc";
          repo = pkgs.fetchFromGitHub {
            owner = "helix-editor";
            repo = "helix";
            rev = version;
            hash = "sha256-ZjMduEHRsY0H8OHJ5oiF/AcxOBhIiCBwo7D+g1yYwKc=";
          };
        };
    in
    {
      overlays.default = final: prev: {
        kak-tree-sitter = import ./nix {
          helix = mkHelix prev;
          pkgs = prev;
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        helix = mkHelix pkgs;
        kak-tree-sitter-themes = pkgs.callPackage (import ./nix/gen-themes.nix { inherit helix; }) { };
        kak-tree-sitter = import ./nix { inherit helix pkgs; };
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = {
          default = kak-tree-sitter;
          themes = kak-tree-sitter-themes;
        };

        apps.default = {
          type = "app";
          program = "${kak-tree-sitter}/bin/kak-tree-sitter";
        };

        homeManagerModules.kak-tree-sitter-helix =
          {
            config,
            lib,
            ...
          }:
          {
            options.programs.kak-tree-sitter-helix.enable = lib.options.mkEnableOption "Enable kak-tree-sitter-helix";

            config = lib.mkIf config.programs.kak-tree-sitter-helix.enable {
              home.packages = [ kak-tree-sitter ];
              xdg.configFile."kak/colors/kak-tree-sitter-helix".source = "${kak-tree-sitter-themes}/colors";
            };
          };

        nixosModules.kak-tree-sitter-helix =
          {
            config,
            lib,
            ...
          }:
          let
            cfg = config.programs.kak-tree-sitter-helix;
          in
          {
            options.programs.kak-tree-sitter-helix = {
              enable = lib.options.mkEnableOption "Enable kak-tree-sitter-helix";

              user = lib.mkOption {
                type = lib.types.str;
                description = "Username for whom to link Kakoune themes from the nix store using systemd user-level tmpfiles";
              };
            };

            config = lib.mkIf cfg.enable {
              environment.systemPackages = [ kak-tree-sitter ];
              systemd.user.tmpfiles.users.${cfg.user}.rules = [
                "L+ /home/${cfg.user}/.config/kak/colors/kak-tree-sitter-helix 0444 - - - ${kak-tree-sitter-themes}/colors"
              ];
            };
          };
      }
    );
}
