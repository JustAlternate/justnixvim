{ pkgs, ... }:
{
  plugins = {
    typescript-tools = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings = {
          ft = [
            "typescript"
            "javascript"
            "tsx"
            "jsx"
          ];
        };
      };
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
