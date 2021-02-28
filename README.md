# 🏡 home-manager

This is the minimalist config I use to handle my dotfiles on my Macbook Pro, everything is reusable just do not forget to edit:

```nix
{
  home.username = "yvan";
  home.homeDirectory = "/Users/yvan";
}
```

This was built using [home-manager](https://github.com/nix-community/home-manager) which works on top of the [Nix](https://nixos.org/guides/install-nix.html) package manager.

I still have dev tools that are not under nix that could be installed with:

```zsh
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh) # https://opam.ocaml.org
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh # https://www.haskell.org/ghcup/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # https://rustup.rs
curl https://wasmtime.dev/install.sh -sSf | bash # https://wasmtime.dev
curl https://get.wasmer.io -sSfL | sh # https://wasmer.io
```

I also use the 🍺 [brew](https://brew.sh) cask system to handle desktop applications.
