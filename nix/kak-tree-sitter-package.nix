{
  fetchFromGitHub,
  git,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kak-tree-sitter";

  version = "1.1.2-dev";

  src = fetchFromGitHub {
    owner = "hadronized";
    repo = "kak-tree-sitter";
    rev = "955b31df81532fc67a2e56279457d587f1d615fb";
    hash = "sha256-LuFI0tRtZZ9C6xKRUbSzE/oI8Z7djo7RvF5xM8776gI=";
  };

  nativeBuildInputs = [git];

  patches = [./kts.patch];

  cargoLock = {lockFile = "${src}/Cargo.lock";};

  # We only need to build kak-tree-sitter, no need to waste time on ktsctl.
  cargoBuildFlags = ["--package=kak-tree-sitter"];
}
