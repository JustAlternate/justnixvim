{ pkgs, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
      };

      formatters = {
        nixfmt = {
          command = "${pkgs.nixfmt}/bin/nixfmt";
        };
      };
    };

    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };

      linters = {
        statix = {
          cmd = "${pkgs.statix}/bin/statix";
        };
      };
    };
  };
}
