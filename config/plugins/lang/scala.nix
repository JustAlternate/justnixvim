{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    scala_2_13
    scalafmt
    coursier
    metals
    sbt
    mill
    openjdk17
  ];

  extraPlugins = [
    pkgs.vimPlugins.nvim-metals
  ];

  plugins = {
    lsp.servers = {
      # metals.enable = true;
    };
  };
}
