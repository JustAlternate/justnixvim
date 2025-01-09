<p align=center>Nixvim flake based on Lazyvim with golang support</p>

---

# 🔨 Installation

If you'd like to give it a try before installing: `nix run github:JustAlternate/gonixvim`

### Adding it as a flake

1: Go to the flake.nix and add `gonixvim.url = "github:JustAlternate/gonixvim"` to your inputs.

```nix
# flake
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    gonixvim.url = "github:JustAlternate/gonixvim";
  };
}
```
2: Run nix flake update

3: Install it by adding `inputs.gonixvim.packages.${system}.default` to your environment.systemPackages or home.packages. If you're using home-manager.

```nix
# packages
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.gonixvim.packages.${system}.default
  ];
}
```

4: Rebuild your system.

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```

# Credits
The original creator of this configuration

- [spector700/Akari](https://github.com/spector700/Akari)
