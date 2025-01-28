{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    scala_3
    scala-cli
    scalafmt
    scalafix
    coursier
    metals
    sbt
    mill
  ];

  extraPlugins = [
    pkgs.vimPlugins.nvim-metals
  ];

  plugins = {
    lsp.servers = {
      metals.enable = true;
    };
  };
}
