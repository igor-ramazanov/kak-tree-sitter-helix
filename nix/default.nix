{
  helix,
  pkgs,
}:
let
  kak-tree-sitter-unwrapped = pkgs.callPackage ./kak-tree-sitter-package.nix { };

  kak-tree-sitter-grammars = pkgs.callPackage (import ./gen-grammars.nix { inherit helix; }) { };

  kak-tree-sitter-config = pkgs.callPackage (import ./gen-config.nix {
    inherit helix kak-tree-sitter-grammars;
  }) { };

  kak-tree-sitter-derivation =
    {
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
in
pkgs.callPackage kak-tree-sitter-derivation {
  inherit
    kak-tree-sitter-config
    kak-tree-sitter-grammars
    kak-tree-sitter-unwrapped
    ;
}
