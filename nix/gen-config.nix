# Even though we use Helix to compile grammars, we still need the config.toml, otherwise kak-tree-sitter will fail.
{
  helix,
  kak-tree-sitter-grammars,
}:
{ pkgs, ... }:
let
  groups = [
    "attribute"
    "comment"
    "comment.block"
    "comment.line"
    "comment.unused"
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
    "function.method.private"
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
    "type.enum.variant.builtin"
    "type.parameter"
    "variable"
    "variable.builtin"
    "variable.other.member"
    "variable.other.member.private"
    "variable.parameter"
    "warning"
  ];

  languagesConfig = builtins.fromTOML (builtins.readFile "${helix.repo}/languages.toml");

  isGitGrammar =
    grammar:
    builtins.hasAttr "source" grammar
    && builtins.hasAttr "git" grammar.source
    && builtins.hasAttr "rev" grammar.source;

  gitGrammars = builtins.map (g: g.name) (builtins.filter isGitGrammar languagesConfig.grammar);

  filteredLanguages = builtins.filter (
    l: (builtins.elem (l.grammar or l.name) gitGrammars)
  ) languagesConfig.language;

  grammars = builtins.map (lang: {
    name = "${lang.name}";
    value = {
      # grammar.compile = "";
      compile_args = [ ];
      compile_flags = [ ];
      # grammar.link = "";
      link_args = [ ];
      link_flags = [ ];
      # grammar.name = lang.grammar or lang.name;
      source.local.path = "${kak-tree-sitter-grammars}/grammars/${lang.grammar or lang.name}.so";
    };
  }) filteredLanguages;

  languages = builtins.map (lang: {
    name = "${lang.name}";
    value = {
      queries.source.local.path = "${kak-tree-sitter-grammars}/queries/${lang.name}";
    };
  }) filteredLanguages;

  config = (pkgs.formats.toml { }).generate "kak-tree-sitter-config.toml" {
    grammar = builtins.listToAttrs grammars;
    language = builtins.listToAttrs languages;
    highlight = { inherit groups; };
    features = {
      highlighting = false;
      text_objects = false;
    };
  };
in
pkgs.runCommandLocal "kak-tree-sitter-config" { } ''
  mkdir $out
  ln -s ${config} $out/config.toml
''
