{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      phpactor.enable = true;
    };
  };
}
