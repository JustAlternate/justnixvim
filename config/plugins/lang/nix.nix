{ pkgs, ... }:
{
  plugins = {
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;

    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [ "nixfmt-rfc-style" ];
      };

      formatters = {
        nixfmt-rfc-style = {
          command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        };
      };
    };

    lint = {
      lintersByFt = {
        nix = [
          "statix"
          "deadnix"
        ];
      };

      linters = {
        statix = {
          cmd = "${pkgs.statix}/bin/statix";
        };

        deadnix = {
          cmd = "${pkgs.deadnix}/bin/deadnix";
        };
      };
    };
  };
}
