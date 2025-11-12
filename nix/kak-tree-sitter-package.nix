{
  fetchFromSourcehut,
  git,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kak-tree-sitter";

  version = "2.0.0-cdcfb42";

  src = fetchFromSourcehut {
    owner = "~hadronized";
    repo = "kak-tree-sitter";
    rev = "cdcfb42da9affd9dd0db9e8df1173731c61e3d9f";
    hash = "sha256-Q8R++fEJMZFftiI9zGjwF7X8mek2oc40Yl9WMUtQWEA=";
  };

  nativeBuildInputs = [ git ];

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
  cargoBuildFlags = [ "--package=kak-tree-sitter" ];
}
