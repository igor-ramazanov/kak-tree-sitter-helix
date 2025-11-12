{ helix }:
{
  stdenv,
  python311,
  ...
}:
stdenv.mkDerivation {
  pname = "kak-tree-sitter-themes";
  version = helix.version;
  src = ./../python;
  buildInputs = [ python311 ];
  buildPhase = ''
    mkdir themes
    cp ${helix.repo}/runtime/themes/*.toml ./themes/
    python3 $src/converter.py
    cp $src/termcolors.kak ./colors/
  '';

  installPhase = ''
    mkdir $out
    mv ./colors $out/
  '';
}
