# kak-tree-sitter-helix
Python and Nix scripts to generate [kak-tree-sitter](https://github.com/phaazon/kak-tree-sitter) grammars, queries and themes by relying on [Helix repository](https://github.com/helix-editor/helix).

## Usage
Nix flakes + [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml) module only for now, because that's what I use.

1. Add this flake url to flake inputs.
2. Pass the home-manager module to `extraSpecialArgs`.
3. Import it: `import = [...];`.
4. In home-manager config file, set `programs.kak-tree-sitter-helix.enable = true;`

This will:
1. Add `kak-tree-sitter` package to your `home.packages`.
1. Create `$XDG_CONFIG_HOME/kak-tree-sitter/config.toml` file.
1. Create `$XDG_CONFIG_HOME/kak/colors` dir with themes.
1. Create `$XDG_DATA_DIR/kak-tree-sitter` dir with grammars and queries.


### Versioning
`A_B_C`, where:
- `A`: `kak-tree-sitter` version
- `B`: `helix` version
- `C`: commit number for the above combination

### Using on non-Nix systems
A [nix-portable](https://github.com/DavHau/nix-portable/tree/v012#bundle-programs) bundle provided for running on non-Nix systems.

The bundle embeds `kak-tree-sitter` config, grammars and queries into the resulting binary without needing to use `ktsctl`:
```bash
VERSION=v1.1.2-dev_25.01.1_1
wget "https://github.com/igor-ramazanov/kak-tree-sitter-helix/releases/download/${VERSION}/kak-tree-sitter-x86_64-linux-wrapped.tar.gz"
tar xzf kak-tree-sitter-x86_64-linux-wrapped.tar.gz
tree -L 1 -h -F kak-tree-sitter-x86_64-linux-wrapped/

# [4.0K]  kak-tree-sitter-x86_64-linux-wrapped//
# ├── [4.0K]  colors/
# └── [ 88M]  kak-tree-sitter*
```

Put the `kak-tree-sitter` executable somewhere to be accessible by `$PATH`.

Move/copy themes to the Kakoune's `colors` directory.

Configure Kakoune:
```KakScript

# Define various kak-tree-sitter commands and options
evaluate-commands %sh{ kak-tree-sitter --init $kak_session --kakoune }

# Optional: delete default highlighters
define-command -override tree-sitter-user-after-highlighter %{
  try %{
    remove-highlighter "window/%opt{filetype}"
  }
}

# Connect to a running kak-tree-sitter server
tree-sitter-session-begin

# Optional: a theme for Kakoune UI elements only to match their colors with the terminal, will be removed eventually
colorscheme termcolors

# Set a theme
colorscheme catppuccin-latte
```

Start a `kak-tree-sitter` server:
```bash
kak-tree-sitter --server -vvvvv
```

Done!

#### Limitations
Because of how `nix-portable`'s bundles work, the `kak-tree-sitter --server --daemonize` won't work, so that's why it's important to run it externally.

### Using home-manager as nixos module

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
            modules = [
              kak-tree-sitter-helix.homeManagerModules.kak-tree-sitter-helix
              ./home.nix
            ];
            users.MY_USERNAME = import ./home.nix;
          };
        }
      ];
    };
  }
}

```

### Using home-manager as standalone option

```nix
# flake.nix
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kak-tree-sitter-helix.url = "github:igor-ramazanov/kak-tree-sitter-helix";
    kak-tree-sitter-helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, kak-tree-sitter-helix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."username" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          kak-tree-sitter-helix.homeManagerModules.kak-tree-sitter-helix
          ./home.nix 
        ];
      };
    };
```

### Then in home.nix

```nix
{
  programs.kak-tree-sitter-helix.enable = true;
}
```

### Using nixosModules

```nix
# flake.nix
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    kak-tree-sitter-helix.url = "github:igor-ramazanov/kak-tree-sitter-helix";
    kak-tree-sitter-helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, kak-tree-sitter-helix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.MY_PC_HOSTNAME = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          kak-tree-sitter-helix.nixosModules.${system}.kak-tree-sitter-helix
          ./configuration.nix 
        ];
      };
    };
```

#### Then in configuration.nix

```nix
{
  programs.kak-tree-sitter-helix = {
    enable = true;
    # This will link themes directory directly from the /nix/store as /home/my_username/.config/kak/color/kak-tree-sitter-helix using systemd tmpfiles
    user = "my_username";
  };
}
```

Make sure you have the following code somewhere in `$XDG_CONFIG_DIR/kak/autoload` or in `$XDG_CONFIG_DIR/kak/kakrc`:
```KakScript
eval %sh{ kak-tree-sitter -dks --init $kak_session }
colorscheme termcolors # Unnecessary, read below.
colorscheme catppuccin-latte # Or any other theme from $XDG_CONFIG_DIR/kak/colors.
```
For more information on kak-tree-sitter flags visit [usage manual](https://github.com/hadronized/kak-tree-sitter/blob/master/docs/man/usage.md).

### termcolors.kak
The `$XDG_CONFIG_DIR/kak/colors/termcolors.kak` opinionatedly sets default Kakoune faces using ANSI terminal colors.\
The reason is that I use [Stylix](https://danth.github.io/stylix) to have consistent theming across the whole NixOS, and `termcolors.kak` makes the Kakoune UI bit more consistent with the terminal colors.\
I'll remove it in the future once I figure out mapping from Helix to Kakoune's default and UI faces.

## Motivation
`kak-tree-sitter` is an amazing tool that brings the power of [tree-sitter](https://tree-sitter.github.io/tree-sitter/) to [Kakoune](http://kakoune.org).\
However, it requires laboursome configuration to define grammars and themes.\
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
