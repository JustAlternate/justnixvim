{ pkgs, ... }:
{
  plugins = {
    typescript-tools = {
      enable = true;
    };
    lint = {
      lintersByFt = {
        typescript = [ "biomejs" ];
      };
      linters = {
        biomejs.cmd = "${pkgs.biome}/bin/biome";
      };
    };
  };
}
