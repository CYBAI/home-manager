# cybai's home-manager configuration

---

## Pre-requisites

- [Nix](https://nixos.org/download.html) (using [Determinate Nix](https://determinate.systems/))
- [homebrew](https://brew.sh/)

## Installation

```sh
$ nix run home-manager -- switch --flake . --impure
$ nix run nix-darwin#darwin-rebuild -- switch --flake . --impure
```
