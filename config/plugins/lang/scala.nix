{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      metals.enable = true;
    };

    lint = {
      lintersByFt = {
        scala = [ "scalafix" ];
      };

      linters = {
        scalafix = {
          cmd = "${pkgs.scalafix}/bin/scalafix";
        };
      };
    };
  };
}
