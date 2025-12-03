{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixvim,
      flake-utils,
      nixpkgs,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs;
          }
          // import ./lib { inherit pkgs; };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in
      {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };
        packages.default = nvim;
      }
    );
}
