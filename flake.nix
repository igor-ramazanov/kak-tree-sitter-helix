{
  description = "A development environment Nix Flake";

  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    devshell,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [devshell.overlays.default];
        };
      in {
        formatter = pkgs.alejandra;

        devShell = pkgs.devshell.mkShell {
          name = "kak-tree-sitter-helix";
          motd = "Entered kak-tree-sitter-helix development environment";
          packages = [
            (
              pkgs.python311.withPackages (p: [
                p.flake8
                p.python-lsp-server
                p.python-lsp-black
              ])
            )
          ];
        };
      }
    );
}
