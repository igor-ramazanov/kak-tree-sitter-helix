# kak-tree-sitter-helix
Python and Nix scripts to generate [kak-tree-sitter](https://github.com/phaazon/kak-tree-sitter) grammars, queries and themes by relying on [Helix repository](https://github.com/helix-editor/helix).

## Usage
Nix flakes + [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml) module only for now, because that's what I use.

1. Add the this flake to flake inputs.
2. Pass the home-manager module to `extraSpecialArgs`.
3. Import it: `import = [...];`.
4. `programs.kak-tree-sitter-helix.enable = true;`

This will:
1. Add `kak-tree-sitter` package to your `home.packages`.
1. Create `$XDG_CONFIG_HOME/kak-tree-sitter/config.toml` file.
1. Create `$XDG_CONFIG_HOME/kak/colors` dir with themes.
1. Create `$XDG_DATA_DIR/kak-tree-sitter` dir with grammars and queries.

```nix
# flake.nix
{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    kak-tree-sitter-helix.inputs.nixpkgs.follows = "nixpkgs";
    kak-tree-sitter-helix.url = "github:igor-ramazanov/kak-tree-sitter-helix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    home-manager,
    kak-tree-sitter-helix,
    nixpkgs,
    self,
  }: {
    nixosConfigurations.MY_PC_HOSTNAME = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit (kak-tree-sitter-helix.homeManagerModules.x86_64-linux) kak-tree-sitter-helix;
            };
            users.MY_USERNAME = import ./home-manager.nix;
          };
        }
      ];
    };
  }
}

# home-manager.nix
{kak-tree-sitter-helix,...}: {
  imports = [kak-tree-sitter-helix];
  programs.kak-tree-sitter-helix.enable = true;
}
```

Make sure you have the following code somewhere in `$XDG_CONFIG_DIR/kak/autoload`:
```KakScript
eval %sh{ kak-tree-sitter --kakoune --daemonize --server --session $kak_session }
colorscheme termcolors # Unnecessary, read below.
colorscheme catppuccin-latte # Or any other theme from $XDG_CONFIG_DIR/kak/colors.
```

### termcolors.kak
The `$XDG_CONFIG_DIR/kak/colors/termcolors.kak` opinionatedly sets default Kakoune faces using ANSI terminal colors.\
The reason is that I use [Stylix](https://danth.github.io/stylix) to have consistent theming across the whole NixOS, and `termcolors.kak` makes the Kakoune UI bit more consistent with the terminal colors.\
I'll remove it in the future once I figure out mapping from Helix to Kakoune's default and UI faces.

## Motivation
`kak-tree-sitter` is an amazing tool that brings the power of [tree-sitter](https://tree-sitter.github.io/tree-sitter/) to [Kakoune](http://kakoune.org).\
However, it requires laboursome configuration to define grammars and themes.
I would like to recreate Helix-like experience with minimal configuration.

## Note
This repo is in a heavy work-in-progress state, consult with the source code first.

## Screenshots (outdated)
* `nord`:
![image](https://github.com/igor-ramazanov/kak-tree-sitter-helix/assets/12570166/c9f64c37-15a0-481d-af74-619bed47ee25)
* `catpuccin-macchiato`:
![image](https://github.com/igor-ramazanov/kak-tree-sitter-helix/assets/12570166/f28c4193-d0b6-460e-b6aa-a6d483c63b09)
* `everforest-dark`:
![image](https://github.com/igor-ramazanov/kak-tree-sitter-helix/assets/12570166/14741873-8e1f-420b-ba2f-75c83784fab7)
