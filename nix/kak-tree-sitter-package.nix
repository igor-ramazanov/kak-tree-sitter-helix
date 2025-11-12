{
  fetchFromSourcehut,
  git,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kak-tree-sitter";

  version = "3.1.1";

  src = fetchFromSourcehut {
    owner = "~hadronized";
    repo = "kak-tree-sitter";
    rev = "kak-tree-sitter-v${version}";
    hash = "sha256-iDpWzvtM0xQSEqs+TsfW3AGaMYwYkHwWqKrbWPRposc=";
  };

  nativeBuildInputs = [ git ];

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
  cargoBuildFlags = [ "--package=kak-tree-sitter" ];
}
