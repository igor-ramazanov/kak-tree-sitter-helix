{ helix, kts-grammars }: { pkgs, ... }:
let
  groups = [
    "attribute"
    "comment"
    "comment.block"
    "comment.line"
    "constant"
    "constant.builtin"
    "constant.builtin.boolean"
    "constant.character"
    "constant.character.escape"
    "constant.macro"
    "constant.numeric"
    "constant.numeric.float"
    "constant.numeric.integer"
    "constructor"
    "diff.plus"
    "diff.minus"
    "diff.delta"
    "diff.delta.moved"
    "embedded"
    "error"
    "function"
    "function.builtin"
    "function.macro"
    "function.method"
    "function.special"
    "hint"
    "include"
    "info"
    "keyword"
    "keyword.conditional"
    "keyword.control"
    "keyword.control.conditional"
    "keyword.control.except"
    "keyword.control.exception"
    "keyword.control.import"
    "keyword.control.repeat"
    "keyword.control.return"
    "keyword.directive"
    "keyword.function"
    "keyword.operator"
    "keyword.special"
    "keyword.storage"
    "keyword.storage.modifier"
    "keyword.storage.modifier.mut"
    "keyword.storage.modifier.ref"
    "keyword.storage.type"
    "label"
    "load"
    "markup.bold"
    "markup.heading"
    "markup.heading.1"
    "markup.heading.2"
    "markup.heading.3"
    "markup.heading.4"
    "markup.heading.5"
    "markup.heading.6"
    "markup.heading.marker"
    "markup.italic"
    "markup.link.label"
    "markup.link.text"
    "markup.link.url"
    "markup.link.uri"
    "markup.list.checked"
    "markup.list.numbered"
    "markup.list.unchecked"
    "markup.list.unnumbered"
    "markup.quote"
    "markup.raw"
    "markup.raw.block"
    "markup.raw.inline"
    "markup.strikethrough"
    "namespace"
    "operator"
    "punctuation"
    "punctuation.bracket"
    "punctuation.delimiter"
    "punctuation.special"
    "special"
    "string"
    "string.escape"
    "string.regexp"
    "string.special"
    "string.special.path"
    "string.special.symbol"
    "string.symbol"
    "tag"
    "tag.error"
    "text"
    "type"
    "type.builtin"
    "type.enum.variant"
    "variable"
    "variable.builtin"
    "variable.other.member"
    "variable.parameter"
    "warning"
  ];

  # Even though we use Helix to compile grammars, we still need the config.toml, otherwise kak-tree-sitter will fail.
  queries =
    builtins.filter
      (language:
        builtins.substring 0 1 language != "_"
      )
      (builtins.attrNames
        (builtins.readDir "${helix.repo}/runtime/queries")
      );
  languages =
    builtins.map
      (n: {
        name = "${n}";
        value = {
          grammar.compile = "";
          grammar.compile_args = [ ];
          grammar.compile_flags = [ ];
          grammar.link = "";
          grammar.link_args = [ ];
          grammar.link_flags = [ ];
          grammar.path = "";
          grammar.source.local.path = "${kts-grammars}/grammars/${n}.so";
          remove_default_higlighter = true;
          queries.path = "";
          queries.source.local.path = "${kts-grammars}/queries/${n}";
        };
      })
      queries;
  config = (pkgs.formats.toml { }).generate "kak-tree-sitter-config.toml" {
    language = builtins.listToAttrs languages;
    highlight = { inherit groups; };
    features = {
      highlighting = true;
      text_objects = true;
    };
  };
in
pkgs.runCommandLocal "kak-tree-sitter-config" { } ''
  mkdir $out
  ln -s ${config} $out/config.toml
''

